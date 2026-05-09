; DESCRIPTION: Places a yellow 17x65 rectangle at position (405, 24).
; PLAN: r0=405(x), r1=24(y), r2=17(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 24
LDI r2, 17
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
