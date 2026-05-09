; DESCRIPTION: Creates a cyan rectangular region at (287, 186) spanning 71 by 39 pixels.
; PLAN: r0=287(x), r1=186(y), r2=71(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 186
LDI r2, 71
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
