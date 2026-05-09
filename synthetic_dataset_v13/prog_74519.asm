; DESCRIPTION: Creates a black rectangular region at (75, 111) spanning 103 by 109 pixels.
; PLAN: r0=75(x), r1=111(y), r2=103(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 111
LDI r2, 103
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
