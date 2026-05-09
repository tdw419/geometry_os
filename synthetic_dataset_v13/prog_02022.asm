; DESCRIPTION: Creates a cyan rectangular region at (99, 137) spanning 117 by 52 pixels.
; PLAN: r0=99(x), r1=137(y), r2=117(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 137
LDI r2, 117
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
