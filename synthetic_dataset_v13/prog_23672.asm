; DESCRIPTION: Renders a red box of size 118x11 starting at (231, 160).
; PLAN: r0=231(x), r1=160(y), r2=118(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 160
LDI r2, 118
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
