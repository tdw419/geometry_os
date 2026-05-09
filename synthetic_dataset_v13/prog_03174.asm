; DESCRIPTION: Renders a red box of size 37x26 starting at (249, 31).
; PLAN: r0=249(x), r1=31(y), r2=37(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 31
LDI r2, 37
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
