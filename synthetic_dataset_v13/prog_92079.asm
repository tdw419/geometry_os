; DESCRIPTION: Places a blue 51x45 rectangle at position (47, 130).
; PLAN: r0=47(x), r1=130(y), r2=51(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 130
LDI r2, 51
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
