; DESCRIPTION: Renders a orange box of size 18x79 starting at (198, 123).
; PLAN: r0=198(x), r1=123(y), r2=18(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 123
LDI r2, 18
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
