; DESCRIPTION: Renders a red box of size 28x109 starting at (336, 120).
; PLAN: r0=336(x), r1=120(y), r2=28(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 120
LDI r2, 28
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
