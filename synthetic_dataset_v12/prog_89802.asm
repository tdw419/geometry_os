; DESCRIPTION: Creates a green rectangular region at (445, 116) spanning 23 by 26 pixels.
; PLAN: r0=445(x), r1=116(y), r2=23(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 116
LDI r2, 23
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
