; DESCRIPTION: Draws a green line from (298, 105) to (187, 189).
; PLAN: r0=298(x1), r1=105(y1), r2=187(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 105
LDI r2, 187
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
