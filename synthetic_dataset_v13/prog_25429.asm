; DESCRIPTION: Draws a black line from (406, 186) to (42, 158).
; PLAN: r0=406(x1), r1=186(y1), r2=42(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 186
LDI r2, 42
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
