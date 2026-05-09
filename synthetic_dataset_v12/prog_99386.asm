; DESCRIPTION: Draws a cyan line from (264, 214) to (247, 116).
; PLAN: r0=264(x1), r1=214(y1), r2=247(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 214
LDI r2, 247
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
