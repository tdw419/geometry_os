; DESCRIPTION: Creates a cyan rectangular region at (204, 44) spanning 81 by 101 pixels.
; PLAN: r0=204(x), r1=44(y), r2=81(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 44
LDI r2, 81
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
