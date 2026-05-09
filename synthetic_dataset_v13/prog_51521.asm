; DESCRIPTION: Places a green line segment connecting (265, 162) to (228, 82).
; PLAN: r0=265(x1), r1=162(y1), r2=228(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 162
LDI r2, 228
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
