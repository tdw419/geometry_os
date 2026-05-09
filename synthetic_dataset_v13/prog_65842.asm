; DESCRIPTION: Places a green 18x48 rectangle at position (347, 108).
; PLAN: r0=347(x), r1=108(y), r2=18(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 108
LDI r2, 18
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
