; DESCRIPTION: Draws a cyan line from (486, 153) to (98, 20).
; PLAN: r0=486(x1), r1=153(y1), r2=98(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 153
LDI r2, 98
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
