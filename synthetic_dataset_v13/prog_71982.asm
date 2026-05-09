; DESCRIPTION: Places a green 21x18 rectangle at position (473, 226).
; PLAN: r0=473(x), r1=226(y), r2=21(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 226
LDI r2, 21
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
