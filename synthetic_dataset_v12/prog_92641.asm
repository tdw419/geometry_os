; DESCRIPTION: Places a purple 40x29 rectangle at position (214, 38).
; PLAN: r0=214(x), r1=38(y), r2=40(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 38
LDI r2, 40
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
