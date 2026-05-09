; DESCRIPTION: Renders a red box of size 86x79 starting at (349, 53).
; PLAN: r0=349(x), r1=53(y), r2=86(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 53
LDI r2, 86
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
