; DESCRIPTION: Places a white 99x32 rectangle at position (377, 193).
; PLAN: r0=377(x), r1=193(y), r2=99(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 193
LDI r2, 99
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
