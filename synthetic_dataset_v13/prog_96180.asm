; DESCRIPTION: Renders a red box of size 30x60 starting at (251, 156).
; PLAN: r0=251(x), r1=156(y), r2=30(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 156
LDI r2, 30
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
