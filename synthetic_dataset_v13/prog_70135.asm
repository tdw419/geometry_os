; DESCRIPTION: Creates a black rectangular region at (430, 103) spanning 50 by 109 pixels.
; PLAN: r0=430(x), r1=103(y), r2=50(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 103
LDI r2, 50
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
