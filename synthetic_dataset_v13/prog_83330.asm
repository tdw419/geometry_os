; DESCRIPTION: Renders a red box of size 89x56 starting at (281, 126).
; PLAN: r0=281(x), r1=126(y), r2=89(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 126
LDI r2, 89
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
