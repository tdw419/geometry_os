; DESCRIPTION: Draws a magenta line from (320, 74) to (102, 200).
; PLAN: r0=320(x1), r1=74(y1), r2=102(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 74
LDI r2, 102
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
