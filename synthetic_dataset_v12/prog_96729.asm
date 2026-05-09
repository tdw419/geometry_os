; DESCRIPTION: Creates a cyan rectangular region at (53, 165) spanning 91 by 73 pixels.
; PLAN: r0=53(x), r1=165(y), r2=91(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 165
LDI r2, 91
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
