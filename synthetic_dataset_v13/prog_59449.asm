; DESCRIPTION: Renders a magenta line between points (265, 0) and (171, 176).
; PLAN: r0=265(x1), r1=0(y1), r2=171(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 0
LDI r2, 171
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
