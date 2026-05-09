; DESCRIPTION: Renders a orange box of size 104x59 starting at (347, 149).
; PLAN: r0=347(x), r1=149(y), r2=104(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 149
LDI r2, 104
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
