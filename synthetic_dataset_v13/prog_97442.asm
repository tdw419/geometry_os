; DESCRIPTION: Creates a white rectangular region at (427, 197) spanning 53 by 32 pixels.
; PLAN: r0=427(x), r1=197(y), r2=53(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 197
LDI r2, 53
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
