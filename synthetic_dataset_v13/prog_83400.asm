; DESCRIPTION: Places a purple 50x96 rectangle at position (445, 130).
; PLAN: r0=445(x), r1=130(y), r2=50(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 130
LDI r2, 50
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
