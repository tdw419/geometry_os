; DESCRIPTION: Draws a orange line from (240, 195) to (386, 162).
; PLAN: r0=240(x1), r1=195(y1), r2=386(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 195
LDI r2, 386
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
