; DESCRIPTION: Creates a cyan rectangular region at (421, 36) spanning 40 by 37 pixels.
; PLAN: r0=421(x), r1=36(y), r2=40(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 36
LDI r2, 40
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
