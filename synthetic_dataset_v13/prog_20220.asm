; DESCRIPTION: Creates a yellow rectangular region at (450, 26) spanning 12 by 30 pixels.
; PLAN: r0=450(x), r1=26(y), r2=12(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 26
LDI r2, 12
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
