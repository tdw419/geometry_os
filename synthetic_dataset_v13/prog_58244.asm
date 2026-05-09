; DESCRIPTION: Creates a white rectangular region at (39, 82) spanning 73 by 50 pixels.
; PLAN: r0=39(x), r1=82(y), r2=73(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 82
LDI r2, 73
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
