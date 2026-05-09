; DESCRIPTION: Renders a green line between points (451, 228) and (90, 83).
; PLAN: r0=451(x1), r1=228(y1), r2=90(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 228
LDI r2, 90
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
