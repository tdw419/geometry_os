; DESCRIPTION: Renders a black box of size 23x57 starting at (139, 152).
; PLAN: r0=139(x), r1=152(y), r2=23(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 152
LDI r2, 23
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
