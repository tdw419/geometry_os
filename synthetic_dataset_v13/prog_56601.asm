; DESCRIPTION: Creates a white rectangular region at (393, 108) spanning 38 by 45 pixels.
; PLAN: r0=393(x), r1=108(y), r2=38(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 108
LDI r2, 38
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
