; DESCRIPTION: Creates a white rectangular region at (77, 188) spanning 16 by 47 pixels.
; PLAN: r0=77(x), r1=188(y), r2=16(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 188
LDI r2, 16
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
