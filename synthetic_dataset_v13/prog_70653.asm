; DESCRIPTION: Draws a cyan line from (202, 246) to (181, 19).
; PLAN: r0=202(x1), r1=246(y1), r2=181(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 246
LDI r2, 181
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
