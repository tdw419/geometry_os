; DESCRIPTION: Places a green line segment connecting (125, 228) to (212, 34).
; PLAN: r0=125(x1), r1=228(y1), r2=212(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 228
LDI r2, 212
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
