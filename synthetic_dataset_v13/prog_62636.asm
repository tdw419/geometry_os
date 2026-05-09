; DESCRIPTION: Places a purple 120x80 rectangle at position (372, 28).
; PLAN: r0=372(x), r1=28(y), r2=120(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 28
LDI r2, 120
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
