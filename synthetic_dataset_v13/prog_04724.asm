; DESCRIPTION: Renders a orange box of size 22x40 starting at (157, 169).
; PLAN: r0=157(x), r1=169(y), r2=22(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 169
LDI r2, 22
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
