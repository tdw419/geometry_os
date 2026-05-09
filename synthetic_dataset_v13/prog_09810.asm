; DESCRIPTION: Places a purple 107x86 rectangle at position (270, 141).
; PLAN: r0=270(x), r1=141(y), r2=107(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 141
LDI r2, 107
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
