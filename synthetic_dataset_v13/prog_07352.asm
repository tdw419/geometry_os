; DESCRIPTION: Places a green line segment connecting (479, 118) to (360, 111).
; PLAN: r0=479(x1), r1=118(y1), r2=360(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 118
LDI r2, 360
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
