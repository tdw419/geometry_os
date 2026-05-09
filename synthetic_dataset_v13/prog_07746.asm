; DESCRIPTION: Renders a white line between points (504, 225) and (281, 110).
; PLAN: r0=504(x1), r1=225(y1), r2=281(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 225
LDI r2, 281
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
