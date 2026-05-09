; DESCRIPTION: Renders a white line between points (26, 21) and (398, 251).
; PLAN: r0=26(x1), r1=21(y1), r2=398(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 21
LDI r2, 398
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
