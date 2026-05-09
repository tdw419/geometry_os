; DESCRIPTION: Renders a red box of size 61x85 starting at (187, 112).
; PLAN: r0=187(x), r1=112(y), r2=61(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 112
LDI r2, 61
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
