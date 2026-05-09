; DESCRIPTION: Draws a magenta line from (17, 95) to (479, 68).
; PLAN: r0=17(x1), r1=95(y1), r2=479(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 95
LDI r2, 479
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
