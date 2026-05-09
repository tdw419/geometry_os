; DESCRIPTION: Creates a cyan rectangular region at (64, 52) spanning 21 by 109 pixels.
; PLAN: r0=64(x), r1=52(y), r2=21(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 52
LDI r2, 21
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
