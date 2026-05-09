; DESCRIPTION: Renders a red box of size 75x95 starting at (345, 141).
; PLAN: r0=345(x), r1=141(y), r2=75(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 141
LDI r2, 75
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
