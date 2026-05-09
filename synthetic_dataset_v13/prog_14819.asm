; DESCRIPTION: Creates a white rectangular region at (197, 8) spanning 13 by 40 pixels.
; PLAN: r0=197(x), r1=8(y), r2=13(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 8
LDI r2, 13
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
