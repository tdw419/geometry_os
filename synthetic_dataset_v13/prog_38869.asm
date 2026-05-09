; DESCRIPTION: Places a yellow 111x57 rectangle at position (37, 18).
; PLAN: r0=37(x), r1=18(y), r2=111(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 18
LDI r2, 111
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
