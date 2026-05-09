; DESCRIPTION: Renders a orange box of size 89x64 starting at (14, 153).
; PLAN: r0=14(x), r1=153(y), r2=89(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 153
LDI r2, 89
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
