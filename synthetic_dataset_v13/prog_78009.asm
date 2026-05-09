; DESCRIPTION: Places a yellow 113x108 rectangle at position (156, 138).
; PLAN: r0=156(x), r1=138(y), r2=113(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 138
LDI r2, 113
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
