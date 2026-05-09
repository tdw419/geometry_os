; DESCRIPTION: Renders a orange box of size 92x54 starting at (238, 29).
; PLAN: r0=238(x), r1=29(y), r2=92(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 29
LDI r2, 92
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
