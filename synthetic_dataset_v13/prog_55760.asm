; DESCRIPTION: Places a yellow line segment connecting (151, 205) to (479, 12).
; PLAN: r0=151(x1), r1=205(y1), r2=479(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 205
LDI r2, 479
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
