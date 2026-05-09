; DESCRIPTION: Draws a cyan line from (116, 187) to (85, 249).
; PLAN: r0=116(x1), r1=187(y1), r2=85(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 187
LDI r2, 85
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
