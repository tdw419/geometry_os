; DESCRIPTION: Renders a red box of size 53x16 starting at (165, 157).
; PLAN: r0=165(x), r1=157(y), r2=53(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 157
LDI r2, 53
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
