; DESCRIPTION: Draws a yellow line from (479, 222) to (76, 134).
; PLAN: r0=479(x1), r1=222(y1), r2=76(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 222
LDI r2, 76
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
