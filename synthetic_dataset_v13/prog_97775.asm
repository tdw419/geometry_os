; DESCRIPTION: Draws a cyan line from (5, 122) to (240, 130).
; PLAN: r0=5(x1), r1=122(y1), r2=240(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 122
LDI r2, 240
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
