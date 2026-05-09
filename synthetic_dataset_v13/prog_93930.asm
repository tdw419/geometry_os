; DESCRIPTION: Places a purple 47x69 rectangle at position (243, 41).
; PLAN: r0=243(x), r1=41(y), r2=47(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 41
LDI r2, 47
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
