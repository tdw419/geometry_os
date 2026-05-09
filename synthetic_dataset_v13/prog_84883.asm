; DESCRIPTION: Draws a black line from (339, 152) to (334, 186).
; PLAN: r0=339(x1), r1=152(y1), r2=334(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 152
LDI r2, 334
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
