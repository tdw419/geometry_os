; DESCRIPTION: Draws a white line from (479, 27) to (15, 147).
; PLAN: r0=479(x1), r1=27(y1), r2=15(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 27
LDI r2, 15
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
