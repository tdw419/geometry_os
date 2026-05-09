; DESCRIPTION: Renders a orange box of size 104x63 starting at (304, 90).
; PLAN: r0=304(x), r1=90(y), r2=104(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 90
LDI r2, 104
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
