; DESCRIPTION: Renders a white line between points (202, 220) and (17, 160).
; PLAN: r0=202(x1), r1=220(y1), r2=17(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 220
LDI r2, 17
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
