; DESCRIPTION: Renders a cyan line between points (286, 228) and (471, 12).
; PLAN: r0=286(x1), r1=228(y1), r2=471(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 228
LDI r2, 471
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
