; DESCRIPTION: Renders a red box of size 84x32 starting at (189, 131).
; PLAN: r0=189(x), r1=131(y), r2=84(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 131
LDI r2, 84
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
