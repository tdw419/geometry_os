; DESCRIPTION: Places a purple 25x35 rectangle at position (480, 174).
; PLAN: r0=480(x), r1=174(y), r2=25(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 174
LDI r2, 25
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
