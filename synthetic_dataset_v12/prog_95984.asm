; DESCRIPTION: Creates a cyan rectangular region at (173, 155) spanning 29 by 34 pixels.
; PLAN: r0=173(x), r1=155(y), r2=29(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 155
LDI r2, 29
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
