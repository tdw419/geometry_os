; DESCRIPTION: Draws a cyan line from (475, 0) to (0, 17).
; PLAN: r0=475(x1), r1=0(y1), r2=0(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 0
LDI r2, 0
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
