; DESCRIPTION: Creates a magenta rectangular region at (256, 10) spanning 104 by 47 pixels.
; PLAN: r0=256(x), r1=10(y), r2=104(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 10
LDI r2, 104
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
