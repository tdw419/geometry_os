; DESCRIPTION: Creates a cyan rectangular region at (16, 54) spanning 87 by 29 pixels.
; PLAN: r0=16(x), r1=54(y), r2=87(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 54
LDI r2, 87
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
