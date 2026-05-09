; DESCRIPTION: Creates a cyan rectangular region at (192, 58) spanning 107 by 71 pixels.
; PLAN: r0=192(x), r1=58(y), r2=107(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 58
LDI r2, 107
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
