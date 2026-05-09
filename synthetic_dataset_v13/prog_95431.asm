; DESCRIPTION: Renders a orange box of size 40x61 starting at (2, 143).
; PLAN: r0=2(x), r1=143(y), r2=40(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 143
LDI r2, 40
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
