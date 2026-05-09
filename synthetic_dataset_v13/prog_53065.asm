; DESCRIPTION: Renders a white line between points (495, 220) and (340, 65).
; PLAN: r0=495(x1), r1=220(y1), r2=340(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 220
LDI r2, 340
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
