; DESCRIPTION: Renders a green line between points (298, 162) and (76, 5).
; PLAN: r0=298(x1), r1=162(y1), r2=76(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 162
LDI r2, 76
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
