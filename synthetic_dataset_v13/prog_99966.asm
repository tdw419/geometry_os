; DESCRIPTION: Places a purple 53x77 rectangle at position (277, 166).
; PLAN: r0=277(x), r1=166(y), r2=53(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 166
LDI r2, 53
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
