; DESCRIPTION: Places a magenta line segment connecting (189, 203) to (502, 208).
; PLAN: r0=189(x1), r1=203(y1), r2=502(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 203
LDI r2, 502
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
