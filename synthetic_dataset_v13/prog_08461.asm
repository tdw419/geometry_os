; DESCRIPTION: Draws a cyan line from (457, 45) to (285, 186).
; PLAN: r0=457(x1), r1=45(y1), r2=285(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 45
LDI r2, 285
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
