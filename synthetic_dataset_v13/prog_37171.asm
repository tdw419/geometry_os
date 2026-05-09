; DESCRIPTION: Draws a black line from (82, 226) to (479, 36).
; PLAN: r0=82(x1), r1=226(y1), r2=479(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 226
LDI r2, 479
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
