; DESCRIPTION: Renders a magenta line between points (320, 172) and (20, 250).
; PLAN: r0=320(x1), r1=172(y1), r2=20(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 172
LDI r2, 20
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
