; DESCRIPTION: Renders a cyan box of size 108x58 starting at (388, 147).
; PLAN: r0=388(x), r1=147(y), r2=108(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 147
LDI r2, 108
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
