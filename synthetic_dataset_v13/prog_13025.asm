; DESCRIPTION: Creates a white rectangular region at (392, 9) spanning 82 by 29 pixels.
; PLAN: r0=392(x), r1=9(y), r2=82(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 9
LDI r2, 82
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
