; DESCRIPTION: Draws a cyan line from (352, 166) to (437, 136).
; PLAN: r0=352(x1), r1=166(y1), r2=437(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 166
LDI r2, 437
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
