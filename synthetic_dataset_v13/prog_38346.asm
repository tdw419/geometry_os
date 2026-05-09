; DESCRIPTION: Creates a white rectangular region at (160, 206) spanning 56 by 45 pixels.
; PLAN: r0=160(x), r1=206(y), r2=56(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 206
LDI r2, 56
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
