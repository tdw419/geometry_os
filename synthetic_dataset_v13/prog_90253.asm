; DESCRIPTION: Composite: Renders a black box of size 98x99 starting at (134, 35) then Renders a blue line between points (148, 87) and (90, 225).
; PLAN: r0=134(x), r1=35(y), r2=98(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x1), r6=87(y1), r7=90(x2), r8=225(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 35
LDI r2, 98
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 87
LDI r7, 90
LDI r8, 225
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
