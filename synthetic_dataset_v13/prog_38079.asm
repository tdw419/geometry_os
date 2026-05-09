; DESCRIPTION: Creates a cyan rectangular region at (34, 152) spanning 111 by 53 pixels.
; PLAN: r0=34(x), r1=152(y), r2=111(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 152
LDI r2, 111
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
