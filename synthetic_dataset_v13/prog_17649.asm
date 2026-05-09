; DESCRIPTION: Creates a cyan rectangular region at (288, 2) spanning 33 by 86 pixels.
; PLAN: r0=288(x), r1=2(y), r2=33(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 2
LDI r2, 33
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
