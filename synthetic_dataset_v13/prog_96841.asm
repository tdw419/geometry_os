; DESCRIPTION: Creates a cyan rectangular region at (281, 52) spanning 20 by 18 pixels.
; PLAN: r0=281(x), r1=52(y), r2=20(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 52
LDI r2, 20
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
