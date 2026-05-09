; DESCRIPTION: Draws a cyan line from (72, 32) to (36, 100).
; PLAN: r0=72(x1), r1=32(y1), r2=36(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 32
LDI r2, 36
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
