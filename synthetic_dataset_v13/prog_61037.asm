; DESCRIPTION: Renders a red box of size 63x89 starting at (133, 50).
; PLAN: r0=133(x), r1=50(y), r2=63(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 50
LDI r2, 63
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
