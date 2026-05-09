; DESCRIPTION: Draws a green line from (362, 139) to (189, 42).
; PLAN: r0=362(x1), r1=139(y1), r2=189(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 139
LDI r2, 189
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
