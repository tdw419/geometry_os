; DESCRIPTION: Places a green line segment connecting (292, 215) to (337, 223).
; PLAN: r0=292(x1), r1=215(y1), r2=337(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 215
LDI r2, 337
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
