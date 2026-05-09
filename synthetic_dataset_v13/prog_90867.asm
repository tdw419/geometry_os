; DESCRIPTION: Renders a white line between points (367, 37) and (211, 215).
; PLAN: r0=367(x1), r1=37(y1), r2=211(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 37
LDI r2, 211
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
