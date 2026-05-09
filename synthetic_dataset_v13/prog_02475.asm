; DESCRIPTION: Renders a green line between points (57, 210) and (109, 111).
; PLAN: r0=57(x1), r1=210(y1), r2=109(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 210
LDI r2, 109
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
