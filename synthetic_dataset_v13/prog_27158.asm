; DESCRIPTION: Renders a red box of size 57x10 starting at (143, 99).
; PLAN: r0=143(x), r1=99(y), r2=57(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 99
LDI r2, 57
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
