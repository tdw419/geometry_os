; DESCRIPTION: Renders a white line between points (459, 243) and (206, 225).
; PLAN: r0=459(x1), r1=243(y1), r2=206(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 243
LDI r2, 206
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
