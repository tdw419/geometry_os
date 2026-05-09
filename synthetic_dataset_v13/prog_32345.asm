; DESCRIPTION: Renders a red box of size 86x38 starting at (251, 90).
; PLAN: r0=251(x), r1=90(y), r2=86(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 90
LDI r2, 86
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
