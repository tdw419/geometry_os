; DESCRIPTION: Draws a cyan line from (261, 109) to (372, 69).
; PLAN: r0=261(x1), r1=109(y1), r2=372(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 109
LDI r2, 372
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
