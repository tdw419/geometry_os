; DESCRIPTION: Places a purple 27x17 rectangle at position (385, 110).
; PLAN: r0=385(x), r1=110(y), r2=27(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 110
LDI r2, 27
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
