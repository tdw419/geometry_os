; DESCRIPTION: Draws a cyan line from (52, 98) to (5, 149).
; PLAN: r0=52(x1), r1=98(y1), r2=5(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 98
LDI r2, 5
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
