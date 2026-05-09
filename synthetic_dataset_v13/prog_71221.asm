; DESCRIPTION: Places a purple 33x68 rectangle at position (225, 95).
; PLAN: r0=225(x), r1=95(y), r2=33(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 95
LDI r2, 33
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
