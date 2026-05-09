; DESCRIPTION: Creates a red rectangular region at (223, 104) spanning 57 by 54 pixels.
; PLAN: r0=223(x), r1=104(y), r2=57(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 104
LDI r2, 57
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
