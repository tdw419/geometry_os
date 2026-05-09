; DESCRIPTION: Places a yellow 76x108 rectangle at position (267, 141).
; PLAN: r0=267(x), r1=141(y), r2=76(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 141
LDI r2, 76
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
