; DESCRIPTION: Draws a cyan line from (448, 141) to (473, 21).
; PLAN: r0=448(x1), r1=141(y1), r2=473(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 141
LDI r2, 473
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
