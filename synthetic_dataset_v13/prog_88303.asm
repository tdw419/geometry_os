; DESCRIPTION: Composite: Creates a orange circular shape at (249, 132) with radius 34 then Places a cyan dot at position (117, 108) then Renders a cyan box of size 72x39 starting at (103, 17).
; PLAN: r0=249(x), r1=132(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=108(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=17(y), r12=72(width), r13=39(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 132
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 108
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 17
LDI r12, 72
LDI r13, 39
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
