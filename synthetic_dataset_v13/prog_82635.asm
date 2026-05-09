; DESCRIPTION: Renders a white line between points (260, 55) and (275, 39).
; PLAN: r0=260(x1), r1=55(y1), r2=275(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 55
LDI r2, 275
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
