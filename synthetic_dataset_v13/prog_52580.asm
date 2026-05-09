; DESCRIPTION: Renders a green line between points (280, 117) and (475, 111).
; PLAN: r0=280(x1), r1=117(y1), r2=475(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 117
LDI r2, 475
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
