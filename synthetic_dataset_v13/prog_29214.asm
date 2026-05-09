; DESCRIPTION: Draws a cyan line from (58, 223) to (315, 240).
; PLAN: r0=58(x1), r1=223(y1), r2=315(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 223
LDI r2, 315
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
