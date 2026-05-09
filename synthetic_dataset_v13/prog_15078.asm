; DESCRIPTION: Places a green 96x28 rectangle at position (221, 85).
; PLAN: r0=221(x), r1=85(y), r2=96(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 85
LDI r2, 96
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
