; DESCRIPTION: Renders a cyan line between points (240, 78) and (269, 111).
; PLAN: r0=240(x1), r1=78(y1), r2=269(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 78
LDI r2, 269
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
