; DESCRIPTION: Creates a cyan rectangular region at (480, 172) spanning 13 by 37 pixels.
; PLAN: r0=480(x), r1=172(y), r2=13(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 172
LDI r2, 13
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
