; DESCRIPTION: Creates a cyan rectangular region at (71, 103) spanning 53 by 21 pixels.
; PLAN: r0=71(x), r1=103(y), r2=53(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 103
LDI r2, 53
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
