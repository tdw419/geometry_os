; DESCRIPTION: Renders a white line between points (231, 228) and (38, 89).
; PLAN: r0=231(x1), r1=228(y1), r2=38(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 228
LDI r2, 38
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
