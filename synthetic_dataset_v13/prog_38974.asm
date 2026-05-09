; DESCRIPTION: Places a purple 33x68 rectangle at position (317, 40).
; PLAN: r0=317(x), r1=40(y), r2=33(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 40
LDI r2, 33
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
