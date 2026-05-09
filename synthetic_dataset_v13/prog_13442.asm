; DESCRIPTION: Draws a cyan line from (380, 100) to (99, 39).
; PLAN: r0=380(x1), r1=100(y1), r2=99(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 100
LDI r2, 99
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
