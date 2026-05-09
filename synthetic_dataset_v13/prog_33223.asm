; DESCRIPTION: Draws a green line from (245, 92) to (187, 139).
; PLAN: r0=245(x1), r1=92(y1), r2=187(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 92
LDI r2, 187
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
