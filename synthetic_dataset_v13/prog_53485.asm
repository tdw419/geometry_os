; DESCRIPTION: Renders a white line between points (265, 229) and (508, 27).
; PLAN: r0=265(x1), r1=229(y1), r2=508(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 229
LDI r2, 508
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
