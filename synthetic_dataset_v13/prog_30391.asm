; DESCRIPTION: Places a purple 82x109 rectangle at position (251, 40).
; PLAN: r0=251(x), r1=40(y), r2=82(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 40
LDI r2, 82
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
