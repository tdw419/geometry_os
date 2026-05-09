; DESCRIPTION: Places a purple 66x65 rectangle at position (157, 146).
; PLAN: r0=157(x), r1=146(y), r2=66(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 146
LDI r2, 66
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
