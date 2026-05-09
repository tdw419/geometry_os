; DESCRIPTION: Renders a orange box of size 104x87 starting at (99, 125).
; PLAN: r0=99(x), r1=125(y), r2=104(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 125
LDI r2, 104
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
