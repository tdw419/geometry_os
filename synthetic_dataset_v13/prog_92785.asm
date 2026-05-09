; DESCRIPTION: Creates a red rectangular region at (375, 47) spanning 57 by 104 pixels.
; PLAN: r0=375(x), r1=47(y), r2=57(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 47
LDI r2, 57
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
