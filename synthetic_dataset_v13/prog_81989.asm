; DESCRIPTION: Creates a cyan rectangular region at (204, 189) spanning 51 by 23 pixels.
; PLAN: r0=204(x), r1=189(y), r2=51(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 189
LDI r2, 51
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
