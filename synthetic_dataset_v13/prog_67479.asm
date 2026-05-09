; DESCRIPTION: Renders a red box of size 61x60 starting at (125, 54).
; PLAN: r0=125(x), r1=54(y), r2=61(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 54
LDI r2, 61
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
