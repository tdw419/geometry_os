; DESCRIPTION: Renders a cyan line between points (277, 200) and (1, 73).
; PLAN: r0=277(x1), r1=200(y1), r2=1(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 200
LDI r2, 1
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
