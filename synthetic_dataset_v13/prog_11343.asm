; DESCRIPTION: Creates a black rectangular region at (95, 103) spanning 16 by 16 pixels.
; PLAN: r0=95(x), r1=103(y), r2=16(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 103
LDI r2, 16
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
