; DESCRIPTION: Composite: Renders a yellow line between points (279, 219) and (438, 206) then Renders a black box of size 18x108 starting at (375, 64).
; PLAN: r0=279(x1), r1=219(y1), r2=438(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=64(y), r7=18(width), r8=108(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 219
LDI r2, 438
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 64
LDI r7, 18
LDI r8, 108
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
