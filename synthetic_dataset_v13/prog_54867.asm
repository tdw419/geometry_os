; DESCRIPTION: Creates a yellow rectangular region at (173, 16) spanning 74 by 94 pixels.
; PLAN: r0=173(x), r1=16(y), r2=74(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 16
LDI r2, 74
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
