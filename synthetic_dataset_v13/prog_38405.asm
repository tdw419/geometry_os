; DESCRIPTION: Draws a cyan line from (81, 134) to (321, 37).
; PLAN: r0=81(x1), r1=134(y1), r2=321(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 134
LDI r2, 321
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
