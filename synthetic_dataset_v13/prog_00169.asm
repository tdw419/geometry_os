; DESCRIPTION: Renders a red box of size 57x114 starting at (358, 82).
; PLAN: r0=358(x), r1=82(y), r2=57(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 82
LDI r2, 57
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
