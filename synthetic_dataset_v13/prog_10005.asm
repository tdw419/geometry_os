; DESCRIPTION: Creates a cyan rectangular region at (178, 107) spanning 95 by 114 pixels.
; PLAN: r0=178(x), r1=107(y), r2=95(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 107
LDI r2, 95
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
