; DESCRIPTION: Places a yellow 39x112 rectangle at position (319, 32).
; PLAN: r0=319(x), r1=32(y), r2=39(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 32
LDI r2, 39
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
