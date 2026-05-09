; DESCRIPTION: Creates a cyan rectangular region at (287, 174) spanning 63 by 73 pixels.
; PLAN: r0=287(x), r1=174(y), r2=63(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 174
LDI r2, 63
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
