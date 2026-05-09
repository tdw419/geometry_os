; DESCRIPTION: Creates a cyan rectangular region at (36, 166) spanning 22 by 68 pixels.
; PLAN: r0=36(x), r1=166(y), r2=22(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 166
LDI r2, 22
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
