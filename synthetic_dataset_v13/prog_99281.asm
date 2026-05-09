; DESCRIPTION: Renders a orange box of size 14x72 starting at (202, 64).
; PLAN: r0=202(x), r1=64(y), r2=14(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 64
LDI r2, 14
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
