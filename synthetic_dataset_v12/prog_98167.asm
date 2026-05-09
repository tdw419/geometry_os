; DESCRIPTION: Creates a cyan rectangular region at (371, 61) spanning 24 by 20 pixels.
; PLAN: r0=371(x), r1=61(y), r2=24(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 61
LDI r2, 24
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
