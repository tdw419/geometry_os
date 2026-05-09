; DESCRIPTION: Places a green 73x23 rectangle at position (279, 30).
; PLAN: r0=279(x), r1=30(y), r2=73(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 30
LDI r2, 73
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
