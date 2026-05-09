; DESCRIPTION: Creates a cyan rectangular region at (192, 178) spanning 44 by 50 pixels.
; PLAN: r0=192(x), r1=178(y), r2=44(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 178
LDI r2, 44
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
