; DESCRIPTION: Renders a white line between points (502, 248) and (193, 188).
; PLAN: r0=502(x1), r1=248(y1), r2=193(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 248
LDI r2, 193
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
