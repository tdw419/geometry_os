; DESCRIPTION: Creates a cyan rectangular region at (210, 75) spanning 64 by 18 pixels.
; PLAN: r0=210(x), r1=75(y), r2=64(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 75
LDI r2, 64
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
