; DESCRIPTION: Renders a orange box of size 102x68 starting at (198, 15).
; PLAN: r0=198(x), r1=15(y), r2=102(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 15
LDI r2, 102
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
