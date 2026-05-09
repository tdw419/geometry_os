; DESCRIPTION: Renders a cyan line between points (99, 241) and (447, 111).
; PLAN: r0=99(x1), r1=241(y1), r2=447(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 241
LDI r2, 447
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
