; DESCRIPTION: Places a black 71x96 rectangle at position (335, 46).
; PLAN: r0=335(x), r1=46(y), r2=71(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 46
LDI r2, 71
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
