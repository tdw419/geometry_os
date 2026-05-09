; DESCRIPTION: Places a green line segment connecting (442, 238) to (178, 146).
; PLAN: r0=442(x1), r1=238(y1), r2=178(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 238
LDI r2, 178
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
