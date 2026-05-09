; DESCRIPTION: Draws a white line from (364, 186) to (398, 134).
; PLAN: r0=364(x1), r1=186(y1), r2=398(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 186
LDI r2, 398
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
