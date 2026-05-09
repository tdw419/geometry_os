; DESCRIPTION: Draws a white line from (87, 124) to (332, 184).
; PLAN: r0=87(x1), r1=124(y1), r2=332(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 124
LDI r2, 332
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
