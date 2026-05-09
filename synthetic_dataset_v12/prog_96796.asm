; DESCRIPTION: Places a green line segment connecting (297, 25) to (434, 182).
; PLAN: r0=297(x1), r1=25(y1), r2=434(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 25
LDI r2, 434
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
