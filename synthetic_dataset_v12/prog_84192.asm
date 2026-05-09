; DESCRIPTION: Places a yellow 32x98 rectangle at position (140, 156).
; PLAN: r0=140(x), r1=156(y), r2=32(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 156
LDI r2, 32
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
