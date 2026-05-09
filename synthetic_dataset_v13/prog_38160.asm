; DESCRIPTION: Creates a orange rectangular region at (414, 129) spanning 31 by 69 pixels.
; PLAN: r0=414(x), r1=129(y), r2=31(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 129
LDI r2, 31
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
