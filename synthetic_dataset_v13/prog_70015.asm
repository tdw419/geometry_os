; DESCRIPTION: Draws a cyan line from (198, 81) to (67, 197).
; PLAN: r0=198(x1), r1=81(y1), r2=67(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 81
LDI r2, 67
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
