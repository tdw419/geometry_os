; DESCRIPTION: Renders a orange box of size 37x67 starting at (336, 169).
; PLAN: r0=336(x), r1=169(y), r2=37(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 169
LDI r2, 37
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
