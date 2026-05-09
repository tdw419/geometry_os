; DESCRIPTION: Places a blue 118x86 rectangle at position (362, 76).
; PLAN: r0=362(x), r1=76(y), r2=118(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 76
LDI r2, 118
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
