; DESCRIPTION: Draws a green line from (485, 129) to (408, 18).
; PLAN: r0=485(x1), r1=129(y1), r2=408(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 129
LDI r2, 408
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
