; DESCRIPTION: Renders a yellow box of size 37x94 starting at (445, 53).
; PLAN: r0=445(x), r1=53(y), r2=37(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 53
LDI r2, 37
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
