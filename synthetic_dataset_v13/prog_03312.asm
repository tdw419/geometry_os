; DESCRIPTION: Draws a green line from (0, 129) to (508, 82).
; PLAN: r0=0(x1), r1=129(y1), r2=508(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 129
LDI r2, 508
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
