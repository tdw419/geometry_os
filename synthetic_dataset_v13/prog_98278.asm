; DESCRIPTION: Renders a yellow box of size 57x72 starting at (216, 131).
; PLAN: r0=216(x), r1=131(y), r2=57(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 131
LDI r2, 57
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
