; DESCRIPTION: Draws a cyan line from (112, 31) to (445, 217).
; PLAN: r0=112(x1), r1=31(y1), r2=445(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 31
LDI r2, 445
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
