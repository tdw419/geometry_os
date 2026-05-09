; DESCRIPTION: Draws a white line from (261, 32) to (59, 195).
; PLAN: r0=261(x1), r1=32(y1), r2=59(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 32
LDI r2, 59
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
