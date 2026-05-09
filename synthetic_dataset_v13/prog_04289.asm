; DESCRIPTION: Places a green line segment connecting (4, 42) to (327, 18).
; PLAN: r0=4(x1), r1=42(y1), r2=327(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 42
LDI r2, 327
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
