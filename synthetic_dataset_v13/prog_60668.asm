; DESCRIPTION: Places a yellow 92x83 rectangle at position (326, 128).
; PLAN: r0=326(x), r1=128(y), r2=92(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 128
LDI r2, 92
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
