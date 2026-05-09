; DESCRIPTION: Draws a cyan line from (47, 3) to (261, 135).
; PLAN: r0=47(x1), r1=3(y1), r2=261(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 3
LDI r2, 261
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
