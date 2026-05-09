; DESCRIPTION: Creates a white rectangular region at (197, 13) spanning 15 by 95 pixels.
; PLAN: r0=197(x), r1=13(y), r2=15(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 13
LDI r2, 15
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
