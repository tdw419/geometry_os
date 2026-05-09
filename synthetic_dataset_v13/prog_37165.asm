; DESCRIPTION: Renders a green box of size 50x71 starting at (184, 43).
; PLAN: r0=184(x), r1=43(y), r2=50(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 43
LDI r2, 50
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
