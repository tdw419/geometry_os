; DESCRIPTION: Renders a white line between points (333, 35) and (490, 196).
; PLAN: r0=333(x1), r1=35(y1), r2=490(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 35
LDI r2, 490
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
