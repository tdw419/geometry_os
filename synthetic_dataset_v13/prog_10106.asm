; DESCRIPTION: Draws a cyan line from (343, 22) to (410, 121).
; PLAN: r0=343(x1), r1=22(y1), r2=410(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 22
LDI r2, 410
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
