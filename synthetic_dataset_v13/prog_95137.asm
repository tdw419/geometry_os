; DESCRIPTION: Draws a green line from (445, 68) to (276, 170).
; PLAN: r0=445(x1), r1=68(y1), r2=276(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 68
LDI r2, 276
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
