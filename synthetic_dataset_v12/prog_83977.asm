; DESCRIPTION: Renders a orange box of size 104x74 starting at (111, 10).
; PLAN: r0=111(x), r1=10(y), r2=104(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 10
LDI r2, 104
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
