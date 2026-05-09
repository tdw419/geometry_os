; DESCRIPTION: Places a magenta line segment connecting (405, 193) to (247, 38).
; PLAN: r0=405(x1), r1=193(y1), r2=247(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 193
LDI r2, 247
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
