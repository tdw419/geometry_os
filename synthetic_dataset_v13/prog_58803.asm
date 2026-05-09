; DESCRIPTION: Places a cyan line segment connecting (413, 221) to (83, 141).
; PLAN: r0=413(x1), r1=221(y1), r2=83(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 221
LDI r2, 83
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
