; DESCRIPTION: Draws a green line from (256, 42) to (179, 105).
; PLAN: r0=256(x1), r1=42(y1), r2=179(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 42
LDI r2, 179
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
