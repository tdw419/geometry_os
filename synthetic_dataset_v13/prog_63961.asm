; DESCRIPTION: Creates a cyan rectangular region at (478, 128) spanning 16 by 52 pixels.
; PLAN: r0=478(x), r1=128(y), r2=16(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 128
LDI r2, 16
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
