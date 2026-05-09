; DESCRIPTION: Places a red line segment connecting (166, 12) to (479, 65).
; PLAN: r0=166(x1), r1=12(y1), r2=479(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 12
LDI r2, 479
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
