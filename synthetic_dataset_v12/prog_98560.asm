; DESCRIPTION: Creates a orange rectangular region at (210, 129) spanning 76 by 72 pixels.
; PLAN: r0=210(x), r1=129(y), r2=76(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 129
LDI r2, 76
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
