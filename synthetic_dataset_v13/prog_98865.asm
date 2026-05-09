; DESCRIPTION: Renders a yellow line between points (249, 228) and (293, 171).
; PLAN: r0=249(x1), r1=228(y1), r2=293(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 228
LDI r2, 293
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
