; DESCRIPTION: Draws a cyan line from (375, 57) to (449, 15).
; PLAN: r0=375(x1), r1=57(y1), r2=449(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 57
LDI r2, 449
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
