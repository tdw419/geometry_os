; DESCRIPTION: Draws a blue line from (127, 223) to (64, 111).
; PLAN: r0=127(x1), r1=223(y1), r2=64(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 223
LDI r2, 64
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
