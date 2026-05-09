; DESCRIPTION: Renders a orange box of size 71x86 starting at (90, 108).
; PLAN: r0=90(x), r1=108(y), r2=71(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 108
LDI r2, 71
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
