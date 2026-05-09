; DESCRIPTION: Composite: Places a red 99x28 rectangle at position (385, 158) then Places a red dot at position (346, 117) then Places a cyan circle of radius 45 at center (282, 67).
; PLAN: r0=385(x), r1=158(y), r2=99(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=117(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=67(y), r12=45(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 158
LDI r2, 99
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 117
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 282
LDI r11, 67
LDI r12, 45
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
