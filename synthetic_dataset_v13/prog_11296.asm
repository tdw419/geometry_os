; DESCRIPTION: Creates a white rectangular region at (128, 50) spanning 65 by 40 pixels.
; PLAN: r0=128(x), r1=50(y), r2=65(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 50
LDI r2, 65
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
