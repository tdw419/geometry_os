; DESCRIPTION: Renders a orange box of size 57x56 starting at (12, 92).
; PLAN: r0=12(x), r1=92(y), r2=57(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 92
LDI r2, 57
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
