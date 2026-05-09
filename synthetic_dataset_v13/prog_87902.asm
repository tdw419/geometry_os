; DESCRIPTION: Renders a red box of size 38x81 starting at (238, 38).
; PLAN: r0=238(x), r1=38(y), r2=38(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 38
LDI r2, 38
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
