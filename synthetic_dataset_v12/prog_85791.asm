; DESCRIPTION: Composite: Draws a green rectangle at (386, 9) with width 76 and height 114 then Places a yellow dot at position (16, 254) then Renders a cyan line between points (211, 19) and (213, 6).
; PLAN: r0=386(x), r1=9(y), r2=76(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=254(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=211(x1), r11=19(y1), r12=213(x2), r13=6(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 9
LDI r2, 76
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 254
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 211
LDI r11, 19
LDI r12, 213
LDI r13, 6
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
