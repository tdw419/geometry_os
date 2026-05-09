; DESCRIPTION: Places a yellow 111x26 rectangle at position (20, 156).
; PLAN: r0=20(x), r1=156(y), r2=111(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 156
LDI r2, 111
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
