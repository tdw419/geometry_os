; DESCRIPTION: Renders a red box of size 75x54 starting at (3, 83).
; PLAN: r0=3(x), r1=83(y), r2=75(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 83
LDI r2, 75
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
