; DESCRIPTION: Places a magenta line segment connecting (180, 36) to (284, 241).
; PLAN: r0=180(x1), r1=36(y1), r2=284(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 36
LDI r2, 284
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
