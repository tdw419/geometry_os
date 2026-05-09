; DESCRIPTION: Renders a red box of size 95x36 starting at (300, 173).
; PLAN: r0=300(x), r1=173(y), r2=95(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 173
LDI r2, 95
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
