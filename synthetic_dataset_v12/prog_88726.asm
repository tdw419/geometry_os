; DESCRIPTION: Places a magenta line segment connecting (502, 24) to (402, 107).
; PLAN: r0=502(x1), r1=24(y1), r2=402(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 24
LDI r2, 402
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
