; DESCRIPTION: Draws a cyan line from (213, 15) to (215, 118).
; PLAN: r0=213(x1), r1=15(y1), r2=215(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 15
LDI r2, 215
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
