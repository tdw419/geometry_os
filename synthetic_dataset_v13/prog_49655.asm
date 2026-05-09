; DESCRIPTION: Renders a orange box of size 71x99 starting at (368, 138).
; PLAN: r0=368(x), r1=138(y), r2=71(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 138
LDI r2, 71
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
