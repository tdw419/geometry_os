; DESCRIPTION: Renders a red box of size 86x60 starting at (381, 29).
; PLAN: r0=381(x), r1=29(y), r2=86(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 29
LDI r2, 86
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
