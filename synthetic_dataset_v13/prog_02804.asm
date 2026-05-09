; DESCRIPTION: Places a black line segment connecting (333, 42) to (393, 244).
; PLAN: r0=333(x1), r1=42(y1), r2=393(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 42
LDI r2, 393
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
