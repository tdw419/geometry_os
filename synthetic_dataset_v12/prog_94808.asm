; DESCRIPTION: Draws a cyan line from (182, 251) to (209, 25).
; PLAN: r0=182(x1), r1=251(y1), r2=209(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 251
LDI r2, 209
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
