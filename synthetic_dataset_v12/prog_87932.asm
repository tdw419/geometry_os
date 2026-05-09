; DESCRIPTION: Places a magenta line segment connecting (299, 129) to (113, 195).
; PLAN: r0=299(x1), r1=129(y1), r2=113(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 129
LDI r2, 113
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
