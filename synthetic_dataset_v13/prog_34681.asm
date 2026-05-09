; DESCRIPTION: Draws a cyan line from (173, 15) to (93, 168).
; PLAN: r0=173(x1), r1=15(y1), r2=93(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 15
LDI r2, 93
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
