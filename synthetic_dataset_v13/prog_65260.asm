; DESCRIPTION: Creates a cyan rectangular region at (68, 208) spanning 52 by 26 pixels.
; PLAN: r0=68(x), r1=208(y), r2=52(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 208
LDI r2, 52
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
