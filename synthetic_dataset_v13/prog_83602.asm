; DESCRIPTION: Renders a white line between points (471, 228) and (286, 160).
; PLAN: r0=471(x1), r1=228(y1), r2=286(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 228
LDI r2, 286
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
