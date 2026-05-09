; DESCRIPTION: Renders a cyan line between points (429, 131) and (353, 244).
; PLAN: r0=429(x1), r1=131(y1), r2=353(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 131
LDI r2, 353
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
