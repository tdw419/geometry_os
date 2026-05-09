; DESCRIPTION: Draws a orange line from (479, 69) to (411, 96).
; PLAN: r0=479(x1), r1=69(y1), r2=411(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 69
LDI r2, 411
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
