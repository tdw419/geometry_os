; DESCRIPTION: Draws a cyan line from (424, 73) to (388, 183).
; PLAN: r0=424(x1), r1=73(y1), r2=388(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 73
LDI r2, 388
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
