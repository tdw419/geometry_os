; DESCRIPTION: Draws a green line from (468, 64) to (113, 36).
; PLAN: r0=468(x1), r1=64(y1), r2=113(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 64
LDI r2, 113
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
