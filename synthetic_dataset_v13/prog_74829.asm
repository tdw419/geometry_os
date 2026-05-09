; DESCRIPTION: Renders a orange box of size 104x32 starting at (5, 206).
; PLAN: r0=5(x), r1=206(y), r2=104(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 206
LDI r2, 104
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
