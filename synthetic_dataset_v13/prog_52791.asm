; DESCRIPTION: Places a yellow 13x26 rectangle at position (242, 126).
; PLAN: r0=242(x), r1=126(y), r2=13(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 126
LDI r2, 13
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
