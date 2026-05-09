; DESCRIPTION: Places a magenta line segment connecting (365, 52) to (284, 8).
; PLAN: r0=365(x1), r1=52(y1), r2=284(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 52
LDI r2, 284
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
