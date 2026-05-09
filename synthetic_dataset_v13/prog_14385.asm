; DESCRIPTION: Renders a magenta line between points (398, 73) and (144, 111).
; PLAN: r0=398(x1), r1=73(y1), r2=144(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 73
LDI r2, 144
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
