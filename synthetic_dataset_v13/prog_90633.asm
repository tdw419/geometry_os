; DESCRIPTION: Draws a orange line from (479, 66) to (138, 126).
; PLAN: r0=479(x1), r1=66(y1), r2=138(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 66
LDI r2, 138
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
