; DESCRIPTION: Draws a cyan line from (95, 181) to (65, 163).
; PLAN: r0=95(x1), r1=181(y1), r2=65(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 181
LDI r2, 65
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
