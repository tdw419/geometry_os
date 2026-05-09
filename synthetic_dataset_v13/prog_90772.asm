; DESCRIPTION: Renders a white line between points (198, 86) and (183, 254).
; PLAN: r0=198(x1), r1=86(y1), r2=183(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 86
LDI r2, 183
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
