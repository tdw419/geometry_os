; DESCRIPTION: Places a purple 93x91 rectangle at position (47, 129).
; PLAN: r0=47(x), r1=129(y), r2=93(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 129
LDI r2, 93
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
