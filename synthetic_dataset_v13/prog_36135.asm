; DESCRIPTION: Renders a white line between points (48, 226) and (198, 244).
; PLAN: r0=48(x1), r1=226(y1), r2=198(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 226
LDI r2, 198
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
