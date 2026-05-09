; DESCRIPTION: Renders a orange box of size 104x25 starting at (179, 165).
; PLAN: r0=179(x), r1=165(y), r2=104(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 165
LDI r2, 104
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
