; DESCRIPTION: Renders a red box of size 31x75 starting at (54, 127).
; PLAN: r0=54(x), r1=127(y), r2=31(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 127
LDI r2, 31
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
