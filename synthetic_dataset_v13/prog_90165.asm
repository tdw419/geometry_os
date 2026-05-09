; DESCRIPTION: Draws a orange line from (479, 210) to (382, 132).
; PLAN: r0=479(x1), r1=210(y1), r2=382(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 210
LDI r2, 382
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
