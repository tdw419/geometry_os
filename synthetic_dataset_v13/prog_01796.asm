; DESCRIPTION: Creates a orange rectangular region at (203, 208) spanning 112 by 48 pixels.
; PLAN: r0=203(x), r1=208(y), r2=112(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 208
LDI r2, 112
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
