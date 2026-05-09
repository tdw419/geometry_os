; DESCRIPTION: Places a blue line segment connecting (502, 237) to (46, 10).
; PLAN: r0=502(x1), r1=237(y1), r2=46(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 237
LDI r2, 46
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
