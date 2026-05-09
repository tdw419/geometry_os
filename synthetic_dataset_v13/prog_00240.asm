; DESCRIPTION: Places a purple 49x86 rectangle at position (68, 146).
; PLAN: r0=68(x), r1=146(y), r2=49(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 146
LDI r2, 49
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
