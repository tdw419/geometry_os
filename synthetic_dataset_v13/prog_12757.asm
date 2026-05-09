; DESCRIPTION: Composite: Renders a blue line between points (101, 184) and (16, 24) then Renders a green box of size 114x31 starting at (243, 160).
; PLAN: r0=101(x1), r1=184(y1), r2=16(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=160(y), r7=114(width), r8=31(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 184
LDI r2, 16
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 160
LDI r7, 114
LDI r8, 31
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
