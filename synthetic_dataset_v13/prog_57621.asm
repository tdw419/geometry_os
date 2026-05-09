; DESCRIPTION: Draws a black line from (445, 20) to (501, 40).
; PLAN: r0=445(x1), r1=20(y1), r2=501(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 20
LDI r2, 501
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
