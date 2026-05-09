; DESCRIPTION: Renders a white line between points (275, 181) and (306, 228).
; PLAN: r0=275(x1), r1=181(y1), r2=306(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 181
LDI r2, 306
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
