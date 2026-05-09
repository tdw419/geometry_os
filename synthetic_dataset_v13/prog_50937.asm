; DESCRIPTION: Renders a white line between points (279, 38) and (470, 115).
; PLAN: r0=279(x1), r1=38(y1), r2=470(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 38
LDI r2, 470
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
