; DESCRIPTION: Draws a cyan line from (335, 102) to (478, 42).
; PLAN: r0=335(x1), r1=102(y1), r2=478(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 102
LDI r2, 478
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
