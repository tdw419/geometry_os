; DESCRIPTION: Renders a orange box of size 44x111 starting at (248, 92).
; PLAN: r0=248(x), r1=92(y), r2=44(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 92
LDI r2, 44
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
