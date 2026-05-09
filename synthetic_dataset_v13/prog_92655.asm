; DESCRIPTION: Draws a red line from (247, 39) to (215, 234).
; PLAN: r0=247(x1), r1=39(y1), r2=215(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 39
LDI r2, 215
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
