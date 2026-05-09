; DESCRIPTION: Draws a purple line from (173, 29) to (404, 151).
; PLAN: r0=173(x1), r1=29(y1), r2=404(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 29
LDI r2, 404
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
