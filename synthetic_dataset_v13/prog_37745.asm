; DESCRIPTION: Renders a red box of size 16x31 starting at (103, 219).
; PLAN: r0=103(x), r1=219(y), r2=16(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 219
LDI r2, 16
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
