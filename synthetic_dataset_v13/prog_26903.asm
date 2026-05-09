; DESCRIPTION: Places a yellow line segment connecting (238, 120) to (429, 242).
; PLAN: r0=238(x1), r1=120(y1), r2=429(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 120
LDI r2, 429
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
