; DESCRIPTION: Draws a black line from (273, 208) to (16, 29).
; PLAN: r0=273(x1), r1=208(y1), r2=16(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 208
LDI r2, 16
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
