; DESCRIPTION: Draws a green line from (469, 104) to (268, 183).
; PLAN: r0=469(x1), r1=104(y1), r2=268(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 104
LDI r2, 268
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
