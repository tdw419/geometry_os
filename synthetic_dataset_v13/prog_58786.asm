; DESCRIPTION: Renders a orange box of size 94x111 starting at (233, 104).
; PLAN: r0=233(x), r1=104(y), r2=94(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 104
LDI r2, 94
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
