; DESCRIPTION: Draws a cyan line from (355, 19) to (469, 37).
; PLAN: r0=355(x1), r1=19(y1), r2=469(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 19
LDI r2, 469
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
