; DESCRIPTION: Draws a cyan line from (495, 40) to (261, 83).
; PLAN: r0=495(x1), r1=40(y1), r2=261(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 40
LDI r2, 261
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
