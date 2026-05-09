; DESCRIPTION: Draws a cyan line from (103, 164) to (261, 61).
; PLAN: r0=103(x1), r1=164(y1), r2=261(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 164
LDI r2, 261
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
