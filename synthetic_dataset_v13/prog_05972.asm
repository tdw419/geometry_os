; DESCRIPTION: Places a purple 11x18 rectangle at position (340, 223).
; PLAN: r0=340(x), r1=223(y), r2=11(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 223
LDI r2, 11
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
