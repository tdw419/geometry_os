; DESCRIPTION: Places a blue line segment connecting (113, 206) to (43, 111).
; PLAN: r0=113(x1), r1=206(y1), r2=43(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 206
LDI r2, 43
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
