; DESCRIPTION: Creates a yellow rectangular region at (295, 64) spanning 61 by 86 pixels.
; PLAN: r0=295(x), r1=64(y), r2=61(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 64
LDI r2, 61
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
