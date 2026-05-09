; DESCRIPTION: Renders a white line between points (38, 228) and (46, 93).
; PLAN: r0=38(x1), r1=228(y1), r2=46(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 228
LDI r2, 46
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
