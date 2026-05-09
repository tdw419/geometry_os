; DESCRIPTION: Creates a magenta rectangular region at (129, 65) spanning 104 by 76 pixels.
; PLAN: r0=129(x), r1=65(y), r2=104(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 65
LDI r2, 104
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
