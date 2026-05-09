; DESCRIPTION: Renders a red box of size 58x21 starting at (184, 160).
; PLAN: r0=184(x), r1=160(y), r2=58(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 160
LDI r2, 58
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
