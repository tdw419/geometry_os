; DESCRIPTION: Draws a green line from (168, 38) to (422, 3).
; PLAN: r0=168(x1), r1=38(y1), r2=422(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 38
LDI r2, 422
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
