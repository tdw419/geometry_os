; DESCRIPTION: Places a yellow 72x98 rectangle at position (109, 114).
; PLAN: r0=109(x), r1=114(y), r2=72(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 114
LDI r2, 72
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
