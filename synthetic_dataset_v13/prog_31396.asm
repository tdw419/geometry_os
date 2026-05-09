; DESCRIPTION: Creates a white rectangular region at (39, 0) spanning 16 by 61 pixels.
; PLAN: r0=39(x), r1=0(y), r2=16(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 0
LDI r2, 16
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
