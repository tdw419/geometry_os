; DESCRIPTION: Draws a cyan line from (88, 180) to (82, 66).
; PLAN: r0=88(x1), r1=180(y1), r2=82(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 180
LDI r2, 82
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
