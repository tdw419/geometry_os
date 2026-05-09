; DESCRIPTION: Places a yellow 71x110 rectangle at position (327, 48).
; PLAN: r0=327(x), r1=48(y), r2=71(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 48
LDI r2, 71
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
