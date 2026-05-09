; DESCRIPTION: Renders a red box of size 18x29 starting at (256, 82).
; PLAN: r0=256(x), r1=82(y), r2=18(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 82
LDI r2, 18
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
