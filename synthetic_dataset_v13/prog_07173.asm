; DESCRIPTION: Places a green 59x96 rectangle at position (242, 4).
; PLAN: r0=242(x), r1=4(y), r2=59(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 4
LDI r2, 59
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
