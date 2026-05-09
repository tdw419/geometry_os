; DESCRIPTION: Renders a red box of size 31x60 starting at (292, 83).
; PLAN: r0=292(x), r1=83(y), r2=31(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 83
LDI r2, 31
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
