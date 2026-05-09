; DESCRIPTION: Renders a orange box of size 46x64 starting at (324, 104).
; PLAN: r0=324(x), r1=104(y), r2=46(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 104
LDI r2, 46
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
