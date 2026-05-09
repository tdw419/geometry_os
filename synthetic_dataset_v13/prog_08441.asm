; DESCRIPTION: Creates a black rectangular region at (12, 39) spanning 120 by 44 pixels.
; PLAN: r0=12(x), r1=39(y), r2=120(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 39
LDI r2, 120
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
