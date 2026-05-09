; DESCRIPTION: Renders a orange box of size 92x17 starting at (218, 27).
; PLAN: r0=218(x), r1=27(y), r2=92(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 27
LDI r2, 92
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
