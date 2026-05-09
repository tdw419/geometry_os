; DESCRIPTION: Renders a red box of size 120x97 starting at (184, 149).
; PLAN: r0=184(x), r1=149(y), r2=120(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 149
LDI r2, 120
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
