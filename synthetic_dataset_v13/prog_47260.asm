; DESCRIPTION: Draws a green line from (300, 216) to (346, 64).
; PLAN: r0=300(x1), r1=216(y1), r2=346(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 216
LDI r2, 346
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
