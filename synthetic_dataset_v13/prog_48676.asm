; DESCRIPTION: Places a green 65x108 rectangle at position (76, 28).
; PLAN: r0=76(x), r1=28(y), r2=65(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 28
LDI r2, 65
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
