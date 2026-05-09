; DESCRIPTION: Renders a red box of size 25x115 starting at (131, 61).
; PLAN: r0=131(x), r1=61(y), r2=25(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 61
LDI r2, 25
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
