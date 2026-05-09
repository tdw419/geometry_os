; DESCRIPTION: Creates a black rectangular region at (394, 0) spanning 27 by 117 pixels.
; PLAN: r0=394(x), r1=0(y), r2=27(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 0
LDI r2, 27
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
