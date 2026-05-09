; DESCRIPTION: Renders a yellow box of size 62x57 starting at (405, 87).
; PLAN: r0=405(x), r1=87(y), r2=62(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 87
LDI r2, 62
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
