; DESCRIPTION: Creates a cyan rectangular region at (287, 107) spanning 53 by 50 pixels.
; PLAN: r0=287(x), r1=107(y), r2=53(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 107
LDI r2, 53
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
