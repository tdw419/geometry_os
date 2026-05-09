; DESCRIPTION: Draws a red line from (27, 127) to (64, 170).
; PLAN: r0=27(x1), r1=127(y1), r2=64(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 127
LDI r2, 64
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
