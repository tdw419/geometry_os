; DESCRIPTION: Renders a white line between points (35, 152) and (367, 107).
; PLAN: r0=35(x1), r1=152(y1), r2=367(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 152
LDI r2, 367
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
