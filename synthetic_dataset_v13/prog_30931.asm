; DESCRIPTION: Renders a red box of size 50x112 starting at (0, 44).
; PLAN: r0=0(x), r1=44(y), r2=50(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 44
LDI r2, 50
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
