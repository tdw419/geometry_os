; DESCRIPTION: Renders a magenta line between points (381, 96) and (398, 21).
; PLAN: r0=381(x1), r1=96(y1), r2=398(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 96
LDI r2, 398
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
