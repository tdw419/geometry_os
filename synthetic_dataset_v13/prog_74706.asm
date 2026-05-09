; DESCRIPTION: Places a cyan line segment connecting (429, 225) to (286, 255).
; PLAN: r0=429(x1), r1=225(y1), r2=286(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 225
LDI r2, 286
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
