; DESCRIPTION: Draws a blue line from (117, 213) to (291, 187).
; PLAN: r0=117(x1), r1=213(y1), r2=291(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 213
LDI r2, 291
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
