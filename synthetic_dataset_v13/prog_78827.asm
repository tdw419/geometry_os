; DESCRIPTION: Draws a cyan line from (102, 86) to (148, 49).
; PLAN: r0=102(x1), r1=86(y1), r2=148(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 86
LDI r2, 148
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
