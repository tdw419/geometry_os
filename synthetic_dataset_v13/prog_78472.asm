; DESCRIPTION: Renders a red box of size 61x113 starting at (75, 109).
; PLAN: r0=75(x), r1=109(y), r2=61(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 109
LDI r2, 61
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
