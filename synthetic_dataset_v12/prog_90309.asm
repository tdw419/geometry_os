; DESCRIPTION: Places a cyan line segment connecting (207, 197) to (429, 36).
; PLAN: r0=207(x1), r1=197(y1), r2=429(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 197
LDI r2, 429
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
