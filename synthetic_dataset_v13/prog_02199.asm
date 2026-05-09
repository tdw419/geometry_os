; DESCRIPTION: Creates a cyan rectangular region at (74, 88) spanning 16 by 113 pixels.
; PLAN: r0=74(x), r1=88(y), r2=16(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 88
LDI r2, 16
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
