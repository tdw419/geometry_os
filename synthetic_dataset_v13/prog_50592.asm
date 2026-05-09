; DESCRIPTION: Draws a green line from (372, 204) to (172, 57).
; PLAN: r0=372(x1), r1=204(y1), r2=172(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 204
LDI r2, 172
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
