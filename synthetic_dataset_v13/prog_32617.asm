; DESCRIPTION: Renders a orange box of size 80x104 starting at (165, 60).
; PLAN: r0=165(x), r1=60(y), r2=80(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 60
LDI r2, 80
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
