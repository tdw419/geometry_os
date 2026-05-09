; DESCRIPTION: Creates a cyan rectangular region at (304, 58) spanning 109 by 28 pixels.
; PLAN: r0=304(x), r1=58(y), r2=109(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 58
LDI r2, 109
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
