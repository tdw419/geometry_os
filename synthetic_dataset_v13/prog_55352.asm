; DESCRIPTION: Places a purple 61x40 rectangle at position (433, 120).
; PLAN: r0=433(x), r1=120(y), r2=61(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 120
LDI r2, 61
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
