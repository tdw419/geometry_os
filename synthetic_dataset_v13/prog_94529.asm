; DESCRIPTION: Draws a cyan line from (129, 50) to (72, 36).
; PLAN: r0=129(x1), r1=50(y1), r2=72(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 50
LDI r2, 72
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
