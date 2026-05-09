; DESCRIPTION: Renders a red box of size 16x74 starting at (488, 92).
; PLAN: r0=488(x), r1=92(y), r2=16(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 92
LDI r2, 16
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
