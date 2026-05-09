; DESCRIPTION: Draws a white line from (229, 21) to (48, 55).
; PLAN: r0=229(x1), r1=21(y1), r2=48(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 21
LDI r2, 48
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
