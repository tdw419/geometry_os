; DESCRIPTION: Draws a cyan line from (67, 54) to (261, 223).
; PLAN: r0=67(x1), r1=54(y1), r2=261(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 54
LDI r2, 261
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
