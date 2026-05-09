; DESCRIPTION: Creates a cyan rectangular region at (186, 137) spanning 53 by 16 pixels.
; PLAN: r0=186(x), r1=137(y), r2=53(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 137
LDI r2, 53
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
