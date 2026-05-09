; DESCRIPTION: Renders a orange box of size 27x15 starting at (358, 131).
; PLAN: r0=358(x), r1=131(y), r2=27(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 131
LDI r2, 27
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
