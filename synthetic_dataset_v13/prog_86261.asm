; DESCRIPTION: Renders a green line between points (326, 178) and (37, 111).
; PLAN: r0=326(x1), r1=178(y1), r2=37(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 178
LDI r2, 37
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
