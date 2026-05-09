; DESCRIPTION: Places a yellow 24x24 rectangle at position (86, 126).
; PLAN: r0=86(x), r1=126(y), r2=24(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 126
LDI r2, 24
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
