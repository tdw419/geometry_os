; DESCRIPTION: Draws a cyan line from (57, 101) to (64, 175).
; PLAN: r0=57(x1), r1=101(y1), r2=64(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 101
LDI r2, 64
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
