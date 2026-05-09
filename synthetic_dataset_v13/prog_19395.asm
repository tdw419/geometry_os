; DESCRIPTION: Draws a purple line from (82, 128) to (434, 209).
; PLAN: r0=82(x1), r1=128(y1), r2=434(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 128
LDI r2, 434
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
