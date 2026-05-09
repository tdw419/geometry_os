; DESCRIPTION: Renders a cyan line between points (105, 88) and (300, 111).
; PLAN: r0=105(x1), r1=88(y1), r2=300(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 88
LDI r2, 300
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
