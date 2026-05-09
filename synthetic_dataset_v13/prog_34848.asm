; DESCRIPTION: Creates a red rectangular region at (372, 82) spanning 20 by 82 pixels.
; PLAN: r0=372(x), r1=82(y), r2=20(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 82
LDI r2, 20
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
