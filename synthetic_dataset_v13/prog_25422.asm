; DESCRIPTION: Renders a orange box of size 96x72 starting at (340, 86).
; PLAN: r0=340(x), r1=86(y), r2=96(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 86
LDI r2, 96
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
