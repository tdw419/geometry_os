; DESCRIPTION: Creates a white rectangular region at (0, 150) spanning 64 by 44 pixels.
; PLAN: r0=0(x), r1=150(y), r2=64(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 150
LDI r2, 64
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
