; DESCRIPTION: Creates a cyan rectangular region at (67, 209) spanning 78 by 21 pixels.
; PLAN: r0=67(x), r1=209(y), r2=78(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 209
LDI r2, 78
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
