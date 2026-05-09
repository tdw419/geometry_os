; DESCRIPTION: Draws a purple line from (502, 32) to (229, 24).
; PLAN: r0=502(x1), r1=32(y1), r2=229(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 32
LDI r2, 229
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
