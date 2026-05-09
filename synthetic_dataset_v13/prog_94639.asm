; DESCRIPTION: Places a green 20x16 rectangle at position (322, 183).
; PLAN: r0=322(x), r1=183(y), r2=20(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 183
LDI r2, 20
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
