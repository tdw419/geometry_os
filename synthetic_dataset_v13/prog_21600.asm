; DESCRIPTION: Places a green 61x51 rectangle at position (274, 127).
; PLAN: r0=274(x), r1=127(y), r2=61(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 127
LDI r2, 61
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
