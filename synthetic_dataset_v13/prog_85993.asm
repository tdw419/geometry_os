; DESCRIPTION: Draws a green line from (333, 154) to (32, 74).
; PLAN: r0=333(x1), r1=154(y1), r2=32(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 154
LDI r2, 32
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
