; DESCRIPTION: Draws a green line from (242, 205) to (40, 249).
; PLAN: r0=242(x1), r1=205(y1), r2=40(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 205
LDI r2, 40
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
