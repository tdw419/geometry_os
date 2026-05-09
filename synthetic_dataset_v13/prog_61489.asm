; DESCRIPTION: Creates a cyan rectangular region at (144, 7) spanning 52 by 40 pixels.
; PLAN: r0=144(x), r1=7(y), r2=52(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 7
LDI r2, 52
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
