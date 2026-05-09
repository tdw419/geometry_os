; DESCRIPTION: Places a purple 120x29 rectangle at position (132, 210).
; PLAN: r0=132(x), r1=210(y), r2=120(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 210
LDI r2, 120
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
