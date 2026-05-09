; DESCRIPTION: Places a blue 38x35 rectangle at position (293, 192).
; PLAN: r0=293(x), r1=192(y), r2=38(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 192
LDI r2, 38
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
