; DESCRIPTION: Creates a cyan rectangular region at (443, 58) spanning 17 by 84 pixels.
; PLAN: r0=443(x), r1=58(y), r2=17(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 58
LDI r2, 17
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
