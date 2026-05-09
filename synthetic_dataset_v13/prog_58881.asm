; DESCRIPTION: Places a white line segment connecting (146, 29) to (336, 141).
; PLAN: r0=146(x1), r1=29(y1), r2=336(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 29
LDI r2, 336
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
