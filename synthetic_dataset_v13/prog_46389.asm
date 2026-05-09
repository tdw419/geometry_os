; DESCRIPTION: Creates a cyan rectangular region at (143, 133) spanning 29 by 58 pixels.
; PLAN: r0=143(x), r1=133(y), r2=29(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 133
LDI r2, 29
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
