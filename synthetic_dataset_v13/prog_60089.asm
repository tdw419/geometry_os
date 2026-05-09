; DESCRIPTION: Places a yellow 112x102 rectangle at position (197, 122).
; PLAN: r0=197(x), r1=122(y), r2=112(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 122
LDI r2, 112
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
