; DESCRIPTION: Renders a white line between points (105, 206) and (65, 249).
; PLAN: r0=105(x1), r1=206(y1), r2=65(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 206
LDI r2, 65
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
