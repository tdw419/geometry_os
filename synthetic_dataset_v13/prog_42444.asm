; DESCRIPTION: Creates a white rectangular region at (240, 199) spanning 45 by 16 pixels.
; PLAN: r0=240(x), r1=199(y), r2=45(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 199
LDI r2, 45
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
