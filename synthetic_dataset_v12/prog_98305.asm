; DESCRIPTION: Creates a cyan rectangular region at (141, 107) spanning 111 by 68 pixels.
; PLAN: r0=141(x), r1=107(y), r2=111(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 107
LDI r2, 111
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
