; DESCRIPTION: Renders a blue line between points (174, 194) and (320, 15).
; PLAN: r0=174(x1), r1=194(y1), r2=320(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 194
LDI r2, 320
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
