; DESCRIPTION: Draws a cyan line from (508, 195) to (118, 213).
; PLAN: r0=508(x1), r1=195(y1), r2=118(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 195
LDI r2, 118
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
