; DESCRIPTION: Creates a cyan rectangular region at (277, 18) spanning 43 by 114 pixels.
; PLAN: r0=277(x), r1=18(y), r2=43(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 18
LDI r2, 43
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
