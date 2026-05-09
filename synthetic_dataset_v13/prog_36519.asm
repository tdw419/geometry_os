; DESCRIPTION: Renders a orange box of size 85x52 starting at (383, 146).
; PLAN: r0=383(x), r1=146(y), r2=85(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 146
LDI r2, 85
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
