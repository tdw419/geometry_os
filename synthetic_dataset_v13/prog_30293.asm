; DESCRIPTION: Renders a black line between points (502, 224) and (83, 166).
; PLAN: r0=502(x1), r1=224(y1), r2=83(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 224
LDI r2, 83
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
