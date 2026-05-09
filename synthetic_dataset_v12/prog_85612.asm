; DESCRIPTION: Places a yellow 30x24 rectangle at position (211, 135).
; PLAN: r0=211(x), r1=135(y), r2=30(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 135
LDI r2, 30
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
