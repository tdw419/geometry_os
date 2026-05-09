; DESCRIPTION: Renders a yellow line between points (502, 83) and (372, 206).
; PLAN: r0=502(x1), r1=83(y1), r2=372(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 83
LDI r2, 372
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
