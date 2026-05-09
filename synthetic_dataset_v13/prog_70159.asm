; DESCRIPTION: Places a magenta line segment connecting (346, 71) to (411, 214).
; PLAN: r0=346(x1), r1=71(y1), r2=411(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 71
LDI r2, 411
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
