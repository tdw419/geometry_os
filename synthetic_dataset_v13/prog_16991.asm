; DESCRIPTION: Renders a orange box of size 56x86 starting at (213, 28).
; PLAN: r0=213(x), r1=28(y), r2=56(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 28
LDI r2, 56
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
