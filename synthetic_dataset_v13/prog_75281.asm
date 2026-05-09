; DESCRIPTION: Creates a red rectangular region at (372, 26) spanning 60 by 50 pixels.
; PLAN: r0=372(x), r1=26(y), r2=60(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 26
LDI r2, 60
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
