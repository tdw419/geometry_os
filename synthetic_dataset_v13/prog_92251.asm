; DESCRIPTION: Renders a red box of size 45x65 starting at (85, 47).
; PLAN: r0=85(x), r1=47(y), r2=45(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 47
LDI r2, 45
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
