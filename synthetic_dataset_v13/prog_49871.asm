; DESCRIPTION: Draws a black line from (479, 188) to (44, 250).
; PLAN: r0=479(x1), r1=188(y1), r2=44(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 188
LDI r2, 44
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
