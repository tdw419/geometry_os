; DESCRIPTION: Creates a cyan rectangular region at (237, 64) spanning 18 by 75 pixels.
; PLAN: r0=237(x), r1=64(y), r2=18(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 64
LDI r2, 18
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
