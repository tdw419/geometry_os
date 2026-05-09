; DESCRIPTION: Renders a red box of size 18x57 starting at (156, 94).
; PLAN: r0=156(x), r1=94(y), r2=18(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 94
LDI r2, 18
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
