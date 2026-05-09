; DESCRIPTION: Renders a red box of size 28x95 starting at (215, 161).
; PLAN: r0=215(x), r1=161(y), r2=28(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 161
LDI r2, 28
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
