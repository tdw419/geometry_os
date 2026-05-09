; DESCRIPTION: Renders a red box of size 21x100 starting at (150, 82).
; PLAN: r0=150(x), r1=82(y), r2=21(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 82
LDI r2, 21
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
