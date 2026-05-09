; DESCRIPTION: Places a green 17x53 rectangle at position (154, 147).
; PLAN: r0=154(x), r1=147(y), r2=17(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 147
LDI r2, 17
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
