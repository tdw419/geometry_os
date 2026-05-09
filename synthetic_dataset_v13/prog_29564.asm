; DESCRIPTION: Places a purple 61x100 rectangle at position (211, 107).
; PLAN: r0=211(x), r1=107(y), r2=61(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 107
LDI r2, 61
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
