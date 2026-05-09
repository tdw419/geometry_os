; DESCRIPTION: Renders a red box of size 75x47 starting at (364, 34).
; PLAN: r0=364(x), r1=34(y), r2=75(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 34
LDI r2, 75
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
