; DESCRIPTION: Renders a orange box of size 21x33 starting at (192, 169).
; PLAN: r0=192(x), r1=169(y), r2=21(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 169
LDI r2, 21
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
