; DESCRIPTION: Creates a black rectangular region at (214, 171) spanning 90 by 70 pixels.
; PLAN: r0=214(x), r1=171(y), r2=90(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 171
LDI r2, 90
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
