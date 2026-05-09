; DESCRIPTION: Draws a green line from (205, 121) to (242, 24).
; PLAN: r0=205(x1), r1=121(y1), r2=242(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 121
LDI r2, 242
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
