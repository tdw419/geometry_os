; DESCRIPTION: Renders a red line between points (351, 196) and (361, 228).
; PLAN: r0=351(x1), r1=196(y1), r2=361(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 196
LDI r2, 361
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
