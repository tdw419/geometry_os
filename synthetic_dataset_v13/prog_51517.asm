; DESCRIPTION: Places a purple 55x67 rectangle at position (82, 169).
; PLAN: r0=82(x), r1=169(y), r2=55(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 169
LDI r2, 55
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
