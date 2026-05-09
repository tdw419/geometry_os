; DESCRIPTION: Places a cyan line segment connecting (429, 111) to (377, 250).
; PLAN: r0=429(x1), r1=111(y1), r2=377(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 111
LDI r2, 377
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
