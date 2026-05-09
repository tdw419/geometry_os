; DESCRIPTION: Renders a white line between points (275, 54) and (510, 46).
; PLAN: r0=275(x1), r1=54(y1), r2=510(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 54
LDI r2, 510
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
