; DESCRIPTION: Creates a cyan rectangular region at (240, 17) spanning 103 by 72 pixels.
; PLAN: r0=240(x), r1=17(y), r2=103(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 17
LDI r2, 103
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
