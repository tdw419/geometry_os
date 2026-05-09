; DESCRIPTION: Places a blue 111x51 rectangle at position (86, 202).
; PLAN: r0=86(x), r1=202(y), r2=111(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 202
LDI r2, 111
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
