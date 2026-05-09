; DESCRIPTION: Draws a cyan line from (486, 125) to (84, 30).
; PLAN: r0=486(x1), r1=125(y1), r2=84(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 125
LDI r2, 84
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
