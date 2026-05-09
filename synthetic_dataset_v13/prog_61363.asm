; DESCRIPTION: Renders a red box of size 115x25 starting at (5, 192).
; PLAN: r0=5(x), r1=192(y), r2=115(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 192
LDI r2, 115
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
