; DESCRIPTION: Draws a cyan line from (147, 163) to (50, 24).
; PLAN: r0=147(x1), r1=163(y1), r2=50(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 163
LDI r2, 50
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
