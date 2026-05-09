; DESCRIPTION: Places a purple 73x50 rectangle at position (243, 170).
; PLAN: r0=243(x), r1=170(y), r2=73(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 170
LDI r2, 73
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
