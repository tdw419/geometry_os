; DESCRIPTION: Places a magenta line segment connecting (71, 249) to (387, 61).
; PLAN: r0=71(x1), r1=249(y1), r2=387(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 249
LDI r2, 387
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
