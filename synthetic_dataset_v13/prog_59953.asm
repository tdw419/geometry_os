; DESCRIPTION: Places a magenta line segment connecting (404, 207) to (37, 107).
; PLAN: r0=404(x1), r1=207(y1), r2=37(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 207
LDI r2, 37
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
