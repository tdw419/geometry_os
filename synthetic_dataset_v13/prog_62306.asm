; DESCRIPTION: Creates a cyan rectangular region at (378, 208) spanning 62 by 27 pixels.
; PLAN: r0=378(x), r1=208(y), r2=62(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 208
LDI r2, 62
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
