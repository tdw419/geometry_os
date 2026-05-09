; DESCRIPTION: Places a purple 48x73 rectangle at position (61, 46).
; PLAN: r0=61(x), r1=46(y), r2=48(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 46
LDI r2, 48
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
