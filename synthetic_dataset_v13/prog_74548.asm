; DESCRIPTION: Creates a cyan rectangular region at (257, 166) spanning 87 by 61 pixels.
; PLAN: r0=257(x), r1=166(y), r2=87(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 166
LDI r2, 87
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
