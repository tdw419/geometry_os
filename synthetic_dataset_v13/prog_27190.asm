; DESCRIPTION: Draws a cyan line from (263, 12) to (162, 100).
; PLAN: r0=263(x1), r1=12(y1), r2=162(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 12
LDI r2, 162
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
