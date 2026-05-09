; DESCRIPTION: Renders a red box of size 21x55 starting at (270, 159).
; PLAN: r0=270(x), r1=159(y), r2=21(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 159
LDI r2, 21
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
