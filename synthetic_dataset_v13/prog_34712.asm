; DESCRIPTION: Places a green line segment connecting (479, 72) to (129, 190).
; PLAN: r0=479(x1), r1=72(y1), r2=129(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 72
LDI r2, 129
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
