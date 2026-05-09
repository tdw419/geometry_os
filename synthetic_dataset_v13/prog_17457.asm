; DESCRIPTION: Renders a red box of size 57x73 starting at (157, 63).
; PLAN: r0=157(x), r1=63(y), r2=57(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 63
LDI r2, 57
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
