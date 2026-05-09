; DESCRIPTION: Places a purple 18x98 rectangle at position (104, 27).
; PLAN: r0=104(x), r1=27(y), r2=18(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 27
LDI r2, 18
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
