; DESCRIPTION: Draws a yellow line from (410, 8) to (225, 115).
; PLAN: r0=410(x1), r1=8(y1), r2=225(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 8
LDI r2, 225
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
