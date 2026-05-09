; DESCRIPTION: Draws a green line from (504, 28) to (68, 137).
; PLAN: r0=504(x1), r1=28(y1), r2=68(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 28
LDI r2, 68
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
