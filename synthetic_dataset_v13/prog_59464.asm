; DESCRIPTION: Places a purple 112x68 rectangle at position (113, 182).
; PLAN: r0=113(x), r1=182(y), r2=112(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 182
LDI r2, 112
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
