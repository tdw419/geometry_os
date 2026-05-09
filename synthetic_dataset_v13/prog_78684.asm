; DESCRIPTION: Renders a black box of size 87x57 starting at (405, 46).
; PLAN: r0=405(x), r1=46(y), r2=87(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 46
LDI r2, 87
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
