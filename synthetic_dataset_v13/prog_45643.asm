; DESCRIPTION: Draws a cyan line from (85, 97) to (82, 82).
; PLAN: r0=85(x1), r1=97(y1), r2=82(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 97
LDI r2, 82
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
