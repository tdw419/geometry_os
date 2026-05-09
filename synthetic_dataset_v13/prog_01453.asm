; DESCRIPTION: Creates a cyan rectangular region at (394, 142) spanning 58 by 106 pixels.
; PLAN: r0=394(x), r1=142(y), r2=58(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 142
LDI r2, 58
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
