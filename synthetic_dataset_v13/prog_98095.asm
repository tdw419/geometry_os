; DESCRIPTION: Renders a red box of size 72x38 starting at (156, 47).
; PLAN: r0=156(x), r1=47(y), r2=72(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 47
LDI r2, 72
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
