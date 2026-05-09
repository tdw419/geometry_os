; DESCRIPTION: Draws a cyan line from (473, 8) to (94, 23).
; PLAN: r0=473(x1), r1=8(y1), r2=94(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 8
LDI r2, 94
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
