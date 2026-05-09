; DESCRIPTION: Renders a red box of size 49x85 starting at (87, 47).
; PLAN: r0=87(x), r1=47(y), r2=49(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 47
LDI r2, 49
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
