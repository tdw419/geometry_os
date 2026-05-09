; DESCRIPTION: Renders a black line between points (131, 32) and (220, 111).
; PLAN: r0=131(x1), r1=32(y1), r2=220(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 32
LDI r2, 220
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
