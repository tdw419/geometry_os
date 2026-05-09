; DESCRIPTION: Renders a white line between points (276, 10) and (175, 192).
; PLAN: r0=276(x1), r1=10(y1), r2=175(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 10
LDI r2, 175
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
