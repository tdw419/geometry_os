; DESCRIPTION: Creates a red rectangular region at (245, 133) spanning 104 by 84 pixels.
; PLAN: r0=245(x), r1=133(y), r2=104(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 133
LDI r2, 104
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
