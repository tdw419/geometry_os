; DESCRIPTION: Places a yellow 114x64 rectangle at position (144, 50).
; PLAN: r0=144(x), r1=50(y), r2=114(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 50
LDI r2, 114
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
