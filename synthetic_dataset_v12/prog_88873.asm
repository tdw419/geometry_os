; DESCRIPTION: Draws a magenta line from (495, 14) to (135, 111).
; PLAN: r0=495(x1), r1=14(y1), r2=135(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 14
LDI r2, 135
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
