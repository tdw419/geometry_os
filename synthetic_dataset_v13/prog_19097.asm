; DESCRIPTION: Draws a green line from (486, 16) to (166, 179).
; PLAN: r0=486(x1), r1=16(y1), r2=166(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 16
LDI r2, 166
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
