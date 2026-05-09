; DESCRIPTION: Renders a cyan line between points (465, 6) and (459, 111).
; PLAN: r0=465(x1), r1=6(y1), r2=459(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 6
LDI r2, 459
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
