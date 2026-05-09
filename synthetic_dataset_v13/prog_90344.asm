; DESCRIPTION: Draws a white line from (491, 176) to (360, 83).
; PLAN: r0=491(x1), r1=176(y1), r2=360(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 176
LDI r2, 360
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
