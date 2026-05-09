; DESCRIPTION: Creates a white rectangular region at (27, 27) spanning 16 by 22 pixels.
; PLAN: r0=27(x), r1=27(y), r2=16(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 27
LDI r2, 16
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
