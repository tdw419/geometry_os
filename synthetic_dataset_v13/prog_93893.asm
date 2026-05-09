; DESCRIPTION: Creates a cyan rectangular region at (284, 24) spanning 53 by 102 pixels.
; PLAN: r0=284(x), r1=24(y), r2=53(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 24
LDI r2, 53
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
