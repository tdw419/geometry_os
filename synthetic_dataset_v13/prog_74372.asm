; DESCRIPTION: Draws a cyan line from (412, 7) to (286, 9).
; PLAN: r0=412(x1), r1=7(y1), r2=286(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 7
LDI r2, 286
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
