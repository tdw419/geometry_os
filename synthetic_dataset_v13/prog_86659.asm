; DESCRIPTION: Creates a cyan rectangular region at (362, 17) spanning 113 by 35 pixels.
; PLAN: r0=362(x), r1=17(y), r2=113(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 17
LDI r2, 113
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
