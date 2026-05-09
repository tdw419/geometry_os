; DESCRIPTION: Renders a orange box of size 94x17 starting at (249, 92).
; PLAN: r0=249(x), r1=92(y), r2=94(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 92
LDI r2, 94
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
