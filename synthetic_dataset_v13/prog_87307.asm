; DESCRIPTION: Places a green 25x31 rectangle at position (247, 197).
; PLAN: r0=247(x), r1=197(y), r2=25(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 197
LDI r2, 25
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
