; DESCRIPTION: Creates a magenta rectangular region at (213, 85) spanning 86 by 104 pixels.
; PLAN: r0=213(x), r1=85(y), r2=86(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 85
LDI r2, 86
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
