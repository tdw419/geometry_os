; DESCRIPTION: Draws a green line from (119, 37) to (295, 29).
; PLAN: r0=119(x1), r1=37(y1), r2=295(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 37
LDI r2, 295
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
