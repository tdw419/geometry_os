; DESCRIPTION: Composite: Places a purple line segment connecting (454, 143) to (3, 86) then Places a green dot at position (270, 174) then Renders a cyan box of size 57x43 starting at (227, 139).
; PLAN: r0=454(x1), r1=143(y1), r2=3(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=174(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=227(x), r11=139(y), r12=57(width), r13=43(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 143
LDI r2, 3
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 174
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 227
LDI r11, 139
LDI r12, 57
LDI r13, 43
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
