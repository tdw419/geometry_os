; DESCRIPTION: Places a yellow 99x32 rectangle at position (76, 208).
; PLAN: r0=76(x), r1=208(y), r2=99(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 208
LDI r2, 99
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
