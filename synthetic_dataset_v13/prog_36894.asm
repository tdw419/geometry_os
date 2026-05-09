; DESCRIPTION: Draws a cyan line from (324, 178) to (368, 22).
; PLAN: r0=324(x1), r1=178(y1), r2=368(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 178
LDI r2, 368
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
