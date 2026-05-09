; DESCRIPTION: Renders a orange box of size 38x61 starting at (438, 89).
; PLAN: r0=438(x), r1=89(y), r2=38(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 89
LDI r2, 38
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
