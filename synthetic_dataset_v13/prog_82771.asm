; DESCRIPTION: Creates a cyan rectangular region at (255, 111) spanning 69 by 116 pixels.
; PLAN: r0=255(x), r1=111(y), r2=69(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 111
LDI r2, 69
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
