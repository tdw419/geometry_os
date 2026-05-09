; DESCRIPTION: Renders a orange box of size 38x86 starting at (432, 44).
; PLAN: r0=432(x), r1=44(y), r2=38(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 44
LDI r2, 38
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
