; DESCRIPTION: Creates a white rectangular region at (218, 50) spanning 16 by 64 pixels.
; PLAN: r0=218(x), r1=50(y), r2=16(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 50
LDI r2, 16
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
