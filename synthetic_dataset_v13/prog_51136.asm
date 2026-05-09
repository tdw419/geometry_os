; DESCRIPTION: Renders a white line between points (440, 206) and (283, 172).
; PLAN: r0=440(x1), r1=206(y1), r2=283(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 206
LDI r2, 283
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
