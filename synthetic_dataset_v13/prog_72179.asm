; DESCRIPTION: Renders a red box of size 89x13 starting at (394, 126).
; PLAN: r0=394(x), r1=126(y), r2=89(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 126
LDI r2, 89
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
