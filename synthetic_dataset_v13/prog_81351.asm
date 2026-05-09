; DESCRIPTION: Creates a white rectangular region at (305, 38) spanning 94 by 104 pixels.
; PLAN: r0=305(x), r1=38(y), r2=94(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 38
LDI r2, 94
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
