; DESCRIPTION: Places a magenta line segment connecting (186, 54) to (487, 48).
; PLAN: r0=186(x1), r1=54(y1), r2=487(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 54
LDI r2, 487
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
