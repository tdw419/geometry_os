; DESCRIPTION: Draws a cyan line from (473, 4) to (468, 33).
; PLAN: r0=473(x1), r1=4(y1), r2=468(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 4
LDI r2, 468
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
