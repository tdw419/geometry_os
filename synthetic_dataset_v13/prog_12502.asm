; DESCRIPTION: Draws a cyan line from (447, 25) to (181, 93).
; PLAN: r0=447(x1), r1=25(y1), r2=181(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 25
LDI r2, 181
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
