; DESCRIPTION: Creates a cyan rectangular region at (244, 68) spanning 50 by 113 pixels.
; PLAN: r0=244(x), r1=68(y), r2=50(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 68
LDI r2, 50
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
