; DESCRIPTION: Creates a black rectangular region at (71, 74) spanning 120 by 45 pixels.
; PLAN: r0=71(x), r1=74(y), r2=120(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 74
LDI r2, 120
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
