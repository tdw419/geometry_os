; DESCRIPTION: Creates a white rectangular region at (82, 12) spanning 46 by 86 pixels.
; PLAN: r0=82(x), r1=12(y), r2=46(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 12
LDI r2, 46
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
