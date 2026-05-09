; DESCRIPTION: Renders a white line between points (99, 181) and (225, 215).
; PLAN: r0=99(x1), r1=181(y1), r2=225(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 181
LDI r2, 225
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
