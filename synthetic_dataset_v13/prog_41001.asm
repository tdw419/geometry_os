; DESCRIPTION: Places a green 46x93 rectangle at position (347, 108).
; PLAN: r0=347(x), r1=108(y), r2=46(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 108
LDI r2, 46
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
