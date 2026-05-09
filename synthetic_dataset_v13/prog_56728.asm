; DESCRIPTION: Renders a red box of size 102x29 starting at (60, 202).
; PLAN: r0=60(x), r1=202(y), r2=102(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 202
LDI r2, 102
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
