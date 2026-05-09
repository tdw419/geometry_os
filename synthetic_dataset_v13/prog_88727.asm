; DESCRIPTION: Draws a white line from (284, 29) to (355, 31).
; PLAN: r0=284(x1), r1=29(y1), r2=355(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 29
LDI r2, 355
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
