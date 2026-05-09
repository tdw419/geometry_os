; DESCRIPTION: Draws a white line from (362, 6) to (485, 28).
; PLAN: r0=362(x1), r1=6(y1), r2=485(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 6
LDI r2, 485
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
