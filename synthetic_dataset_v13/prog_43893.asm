; DESCRIPTION: Places a purple 120x20 rectangle at position (281, 114).
; PLAN: r0=281(x), r1=114(y), r2=120(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 114
LDI r2, 120
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
