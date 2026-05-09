; DESCRIPTION: Places a purple 45x46 rectangle at position (290, 43).
; PLAN: r0=290(x), r1=43(y), r2=45(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 43
LDI r2, 45
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
