; DESCRIPTION: Renders a white line between points (444, 150) and (315, 146).
; PLAN: r0=444(x1), r1=150(y1), r2=315(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 150
LDI r2, 315
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
