; DESCRIPTION: Creates a cyan rectangular region at (480, 86) spanning 16 by 68 pixels.
; PLAN: r0=480(x), r1=86(y), r2=16(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 86
LDI r2, 16
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
