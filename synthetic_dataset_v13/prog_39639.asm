; DESCRIPTION: Creates a black rectangular region at (394, 74) spanning 25 by 94 pixels.
; PLAN: r0=394(x), r1=74(y), r2=25(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 74
LDI r2, 25
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
