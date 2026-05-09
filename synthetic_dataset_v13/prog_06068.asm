; DESCRIPTION: Creates a white rectangular region at (347, 93) spanning 83 by 32 pixels.
; PLAN: r0=347(x), r1=93(y), r2=83(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 93
LDI r2, 83
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
