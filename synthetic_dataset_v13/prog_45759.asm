; DESCRIPTION: Places a purple 24x32 rectangle at position (275, 127).
; PLAN: r0=275(x), r1=127(y), r2=24(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 127
LDI r2, 24
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
