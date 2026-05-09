; DESCRIPTION: Renders a red box of size 36x57 starting at (282, 82).
; PLAN: r0=282(x), r1=82(y), r2=36(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 82
LDI r2, 36
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
