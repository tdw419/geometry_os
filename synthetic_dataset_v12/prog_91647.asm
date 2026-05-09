; DESCRIPTION: Creates a cyan rectangular region at (30, 36) spanning 37 by 77 pixels.
; PLAN: r0=30(x), r1=36(y), r2=37(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 36
LDI r2, 37
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
