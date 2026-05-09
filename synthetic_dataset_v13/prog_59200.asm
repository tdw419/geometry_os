; DESCRIPTION: Renders a white line between points (56, 114) and (94, 228).
; PLAN: r0=56(x1), r1=114(y1), r2=94(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 114
LDI r2, 94
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
