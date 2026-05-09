; DESCRIPTION: Creates a cyan rectangular region at (354, 147) spanning 17 by 83 pixels.
; PLAN: r0=354(x), r1=147(y), r2=17(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 147
LDI r2, 17
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
