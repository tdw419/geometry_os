; DESCRIPTION: Renders a red box of size 91x31 starting at (98, 63).
; PLAN: r0=98(x), r1=63(y), r2=91(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 63
LDI r2, 91
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
