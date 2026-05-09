; DESCRIPTION: Creates a yellow rectangular region at (271, 173) spanning 18 by 64 pixels.
; PLAN: r0=271(x), r1=173(y), r2=18(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 173
LDI r2, 18
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
