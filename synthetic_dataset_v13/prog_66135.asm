; DESCRIPTION: Places a purple 39x95 rectangle at position (368, 5).
; PLAN: r0=368(x), r1=5(y), r2=39(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 5
LDI r2, 39
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
