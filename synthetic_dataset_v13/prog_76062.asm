; DESCRIPTION: Places a white line segment connecting (429, 209) to (385, 134).
; PLAN: r0=429(x1), r1=209(y1), r2=385(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 209
LDI r2, 385
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
