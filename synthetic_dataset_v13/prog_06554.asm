; DESCRIPTION: Renders a blue box of size 12x59 starting at (348, 146).
; PLAN: r0=348(x), r1=146(y), r2=12(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 146
LDI r2, 12
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
