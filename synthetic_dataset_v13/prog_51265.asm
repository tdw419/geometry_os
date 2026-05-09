; DESCRIPTION: Places a green 72x83 rectangle at position (309, 81).
; PLAN: r0=309(x), r1=81(y), r2=72(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 81
LDI r2, 72
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
