; DESCRIPTION: Draws a cyan line from (169, 121) to (183, 19).
; PLAN: r0=169(x1), r1=121(y1), r2=183(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 121
LDI r2, 183
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
