; DESCRIPTION: Composite: Draws a blue line from (401, 27) to (281, 218) then Renders a red disk with center (390, 106) and radius 79.
; PLAN: r0=401(x1), r1=27(y1), r2=281(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=106(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 27
LDI r2, 281
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 106
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
