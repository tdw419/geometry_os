; DESCRIPTION: Places a black line segment connecting (42, 9) to (65, 215).
; PLAN: r0=42(x1), r1=9(y1), r2=65(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 9
LDI r2, 65
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
