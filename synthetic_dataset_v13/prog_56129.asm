; DESCRIPTION: Renders a red box of size 17x95 starting at (167, 143).
; PLAN: r0=167(x), r1=143(y), r2=17(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 143
LDI r2, 17
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
