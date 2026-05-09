; DESCRIPTION: Places a purple 120x52 rectangle at position (270, 44).
; PLAN: r0=270(x), r1=44(y), r2=120(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 44
LDI r2, 120
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
