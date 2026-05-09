; DESCRIPTION: Places a magenta line segment connecting (502, 152) to (156, 47).
; PLAN: r0=502(x1), r1=152(y1), r2=156(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 152
LDI r2, 156
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
