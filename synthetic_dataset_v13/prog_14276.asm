; DESCRIPTION: Draws a cyan line from (169, 102) to (284, 34).
; PLAN: r0=169(x1), r1=102(y1), r2=284(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 102
LDI r2, 284
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
