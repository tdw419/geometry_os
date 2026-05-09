; DESCRIPTION: Renders a orange box of size 92x59 starting at (86, 141).
; PLAN: r0=86(x), r1=141(y), r2=92(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 141
LDI r2, 92
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
