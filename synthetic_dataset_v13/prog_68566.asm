; DESCRIPTION: Creates a red rectangular region at (293, 85) spanning 49 by 103 pixels.
; PLAN: r0=293(x), r1=85(y), r2=49(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 85
LDI r2, 49
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
