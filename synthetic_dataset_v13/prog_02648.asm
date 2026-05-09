; DESCRIPTION: Creates a cyan rectangular region at (204, 178) spanning 87 by 58 pixels.
; PLAN: r0=204(x), r1=178(y), r2=87(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 178
LDI r2, 87
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
