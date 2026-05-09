; DESCRIPTION: Renders a red box of size 38x87 starting at (455, 34).
; PLAN: r0=455(x), r1=34(y), r2=38(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 34
LDI r2, 38
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
