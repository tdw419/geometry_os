; DESCRIPTION: Renders a white line between points (286, 28) and (224, 132).
; PLAN: r0=286(x1), r1=28(y1), r2=224(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 28
LDI r2, 224
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
