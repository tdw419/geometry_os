; DESCRIPTION: Renders a orange box of size 92x91 starting at (348, 163).
; PLAN: r0=348(x), r1=163(y), r2=92(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 163
LDI r2, 92
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
