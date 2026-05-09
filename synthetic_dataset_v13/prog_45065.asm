; DESCRIPTION: Places a purple 40x109 rectangle at position (450, 18).
; PLAN: r0=450(x), r1=18(y), r2=40(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 18
LDI r2, 40
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
