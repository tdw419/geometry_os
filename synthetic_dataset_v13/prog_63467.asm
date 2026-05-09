; DESCRIPTION: Renders a orange box of size 18x72 starting at (79, 166).
; PLAN: r0=79(x), r1=166(y), r2=18(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 166
LDI r2, 18
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
