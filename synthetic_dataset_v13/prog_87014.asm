; DESCRIPTION: Draws a yellow line from (410, 118) to (409, 124).
; PLAN: r0=410(x1), r1=118(y1), r2=409(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 118
LDI r2, 409
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
