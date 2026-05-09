; DESCRIPTION: Renders a orange box of size 73x45 starting at (59, 144).
; PLAN: r0=59(x), r1=144(y), r2=73(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 144
LDI r2, 73
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
