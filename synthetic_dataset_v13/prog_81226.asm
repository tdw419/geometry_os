; DESCRIPTION: Draws a cyan line from (328, 115) to (126, 140).
; PLAN: r0=328(x1), r1=115(y1), r2=126(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 115
LDI r2, 126
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
