; DESCRIPTION: Renders a red box of size 87x60 starting at (168, 72).
; PLAN: r0=168(x), r1=72(y), r2=87(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 72
LDI r2, 87
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
