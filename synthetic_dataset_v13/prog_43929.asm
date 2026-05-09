; DESCRIPTION: Renders a red box of size 83x19 starting at (45, 126).
; PLAN: r0=45(x), r1=126(y), r2=83(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 126
LDI r2, 83
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
