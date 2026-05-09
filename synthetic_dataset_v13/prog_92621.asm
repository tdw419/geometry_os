; DESCRIPTION: Draws a green line from (20, 134) to (298, 122).
; PLAN: r0=20(x1), r1=134(y1), r2=298(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 134
LDI r2, 298
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
