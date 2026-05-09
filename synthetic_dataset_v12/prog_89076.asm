; DESCRIPTION: Creates a cyan rectangular region at (124, 63) spanning 32 by 20 pixels.
; PLAN: r0=124(x), r1=63(y), r2=32(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 63
LDI r2, 32
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
