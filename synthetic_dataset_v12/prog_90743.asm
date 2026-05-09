; DESCRIPTION: Renders a white line between points (354, 73) and (7, 169).
; PLAN: r0=354(x1), r1=73(y1), r2=7(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 73
LDI r2, 7
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
