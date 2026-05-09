; DESCRIPTION: Places a blue line segment connecting (70, 228) to (391, 85).
; PLAN: r0=70(x1), r1=228(y1), r2=391(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 228
LDI r2, 391
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
