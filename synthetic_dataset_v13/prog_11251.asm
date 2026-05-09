; DESCRIPTION: Renders a orange box of size 111x71 starting at (336, 47).
; PLAN: r0=336(x), r1=47(y), r2=111(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 47
LDI r2, 111
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
