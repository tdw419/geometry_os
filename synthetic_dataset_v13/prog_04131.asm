; DESCRIPTION: Renders a green line between points (508, 228) and (342, 82).
; PLAN: r0=508(x1), r1=228(y1), r2=342(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 228
LDI r2, 342
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
