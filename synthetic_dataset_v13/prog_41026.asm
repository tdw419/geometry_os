; DESCRIPTION: Creates a cyan rectangular region at (480, 96) spanning 31 by 32 pixels.
; PLAN: r0=480(x), r1=96(y), r2=31(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 96
LDI r2, 31
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
