; DESCRIPTION: Places a yellow 35x10 rectangle at position (240, 234).
; PLAN: r0=240(x), r1=234(y), r2=35(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 234
LDI r2, 35
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
