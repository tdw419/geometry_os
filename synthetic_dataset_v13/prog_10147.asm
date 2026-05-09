; DESCRIPTION: Draws a black line from (317, 85) to (479, 82).
; PLAN: r0=317(x1), r1=85(y1), r2=479(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 85
LDI r2, 479
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
