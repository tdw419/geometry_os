; DESCRIPTION: Creates a white rectangular region at (54, 45) spanning 103 by 64 pixels.
; PLAN: r0=54(x), r1=45(y), r2=103(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 45
LDI r2, 103
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
