; DESCRIPTION: Draws a cyan line from (355, 163) to (276, 207).
; PLAN: r0=355(x1), r1=163(y1), r2=276(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 163
LDI r2, 276
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
