; DESCRIPTION: Places a yellow 42x108 rectangle at position (350, 17).
; PLAN: r0=350(x), r1=17(y), r2=42(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 17
LDI r2, 42
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
