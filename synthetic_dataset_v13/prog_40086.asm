; DESCRIPTION: Draws a green line from (460, 110) to (460, 171).
; PLAN: r0=460(x1), r1=110(y1), r2=460(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 110
LDI r2, 460
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
