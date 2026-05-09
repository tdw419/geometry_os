; DESCRIPTION: Creates a red rectangular region at (203, 129) spanning 44 by 12 pixels.
; PLAN: r0=203(x), r1=129(y), r2=44(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 129
LDI r2, 44
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
