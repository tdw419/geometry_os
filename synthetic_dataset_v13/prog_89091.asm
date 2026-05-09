; DESCRIPTION: Renders a orange box of size 77x22 starting at (215, 104).
; PLAN: r0=215(x), r1=104(y), r2=77(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 104
LDI r2, 77
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
