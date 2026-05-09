; DESCRIPTION: Renders a orange box of size 28x79 starting at (40, 134).
; PLAN: r0=40(x), r1=134(y), r2=28(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 134
LDI r2, 28
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
