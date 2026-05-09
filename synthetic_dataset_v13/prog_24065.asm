; DESCRIPTION: Places a purple 54x40 rectangle at position (363, 29).
; PLAN: r0=363(x), r1=29(y), r2=54(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 29
LDI r2, 54
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
