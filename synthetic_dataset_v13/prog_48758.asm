; DESCRIPTION: Places a black line segment connecting (429, 82) to (350, 42).
; PLAN: r0=429(x1), r1=82(y1), r2=350(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 82
LDI r2, 350
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
