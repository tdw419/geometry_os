; DESCRIPTION: Creates a cyan rectangular region at (257, 87) spanning 16 by 33 pixels.
; PLAN: r0=257(x), r1=87(y), r2=16(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 87
LDI r2, 16
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
