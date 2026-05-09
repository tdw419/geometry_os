; DESCRIPTION: Composite: Draws a black line from (29, 245) to (185, 97) then Renders a yellow box of size 90x54 starting at (345, 167).
; PLAN: r0=29(x1), r1=245(y1), r2=185(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=167(y), r7=90(width), r8=54(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 245
LDI r2, 185
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 167
LDI r7, 90
LDI r8, 54
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
