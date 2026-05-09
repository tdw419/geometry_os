; DESCRIPTION: Renders a black box of size 57x100 starting at (117, 70).
; PLAN: r0=117(x), r1=70(y), r2=57(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 70
LDI r2, 57
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
