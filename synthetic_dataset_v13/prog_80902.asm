; DESCRIPTION: Creates a white rectangular region at (39, 58) spanning 86 by 24 pixels.
; PLAN: r0=39(x), r1=58(y), r2=86(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 58
LDI r2, 86
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
