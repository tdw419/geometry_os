; DESCRIPTION: Renders a red box of size 15x94 starting at (117, 45).
; PLAN: r0=117(x), r1=45(y), r2=15(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 45
LDI r2, 15
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
