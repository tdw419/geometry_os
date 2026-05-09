; DESCRIPTION: Draws a yellow line from (383, 55) to (72, 213).
; PLAN: r0=383(x1), r1=55(y1), r2=72(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 55
LDI r2, 72
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
