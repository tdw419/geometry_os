; DESCRIPTION: Creates a magenta rectangular region at (7, 47) spanning 104 by 85 pixels.
; PLAN: r0=7(x), r1=47(y), r2=104(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 47
LDI r2, 104
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
