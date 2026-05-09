; DESCRIPTION: Draws a purple line from (415, 27) to (20, 91).
; PLAN: r0=415(x1), r1=27(y1), r2=20(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 27
LDI r2, 20
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
