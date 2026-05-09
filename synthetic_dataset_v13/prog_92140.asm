; DESCRIPTION: Renders a white line between points (370, 37) and (367, 5).
; PLAN: r0=370(x1), r1=37(y1), r2=367(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 37
LDI r2, 367
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
