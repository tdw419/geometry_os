; DESCRIPTION: Draws a white line from (298, 69) to (307, 99).
; PLAN: r0=298(x1), r1=69(y1), r2=307(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 69
LDI r2, 307
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
