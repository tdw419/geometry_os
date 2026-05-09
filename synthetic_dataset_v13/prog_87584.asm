; DESCRIPTION: Draws a cyan line from (315, 73) to (90, 148).
; PLAN: r0=315(x1), r1=73(y1), r2=90(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 73
LDI r2, 90
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
