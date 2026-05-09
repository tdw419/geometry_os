; DESCRIPTION: Creates a cyan rectangular region at (58, 131) spanning 53 by 104 pixels.
; PLAN: r0=58(x), r1=131(y), r2=53(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 131
LDI r2, 53
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
