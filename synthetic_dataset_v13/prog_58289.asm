; DESCRIPTION: Places a purple 92x41 rectangle at position (95, 8).
; PLAN: r0=95(x), r1=8(y), r2=92(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 8
LDI r2, 92
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
