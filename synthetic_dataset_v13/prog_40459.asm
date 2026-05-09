; DESCRIPTION: Places a green 65x108 rectangle at position (321, 69).
; PLAN: r0=321(x), r1=69(y), r2=65(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 69
LDI r2, 65
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
