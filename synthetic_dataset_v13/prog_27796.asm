; DESCRIPTION: Renders a magenta line between points (364, 61) and (482, 128).
; PLAN: r0=364(x1), r1=61(y1), r2=482(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 61
LDI r2, 482
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
