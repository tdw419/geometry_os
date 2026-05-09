; DESCRIPTION: Draws a cyan line from (200, 101) to (63, 173).
; PLAN: r0=200(x1), r1=101(y1), r2=63(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 101
LDI r2, 63
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
