; DESCRIPTION: Creates a red rectangular region at (203, 44) spanning 21 by 117 pixels.
; PLAN: r0=203(x), r1=44(y), r2=21(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 44
LDI r2, 21
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
