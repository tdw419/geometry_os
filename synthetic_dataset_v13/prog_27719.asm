; DESCRIPTION: Renders a orange box of size 72x47 starting at (351, 160).
; PLAN: r0=351(x), r1=160(y), r2=72(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 160
LDI r2, 72
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
