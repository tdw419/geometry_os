; DESCRIPTION: Renders a red box of size 61x28 starting at (293, 24).
; PLAN: r0=293(x), r1=24(y), r2=61(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 24
LDI r2, 61
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
