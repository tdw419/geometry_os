; DESCRIPTION: Creates a white rectangular region at (335, 206) spanning 32 by 47 pixels.
; PLAN: r0=335(x), r1=206(y), r2=32(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 206
LDI r2, 32
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
