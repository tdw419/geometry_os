; DESCRIPTION: Creates a cyan rectangular region at (79, 20) spanning 113 by 67 pixels.
; PLAN: r0=79(x), r1=20(y), r2=113(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 20
LDI r2, 113
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
