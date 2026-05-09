; DESCRIPTION: Places a black line segment connecting (242, 243) to (232, 42).
; PLAN: r0=242(x1), r1=243(y1), r2=232(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 243
LDI r2, 232
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
