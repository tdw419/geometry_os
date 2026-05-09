; DESCRIPTION: Renders a red box of size 100x44 starting at (87, 169).
; PLAN: r0=87(x), r1=169(y), r2=100(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 169
LDI r2, 100
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
