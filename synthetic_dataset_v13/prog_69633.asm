; DESCRIPTION: Renders a white line between points (105, 39) and (308, 57).
; PLAN: r0=105(x1), r1=39(y1), r2=308(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 39
LDI r2, 308
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
