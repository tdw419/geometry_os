; DESCRIPTION: Places a cyan 93x11 rectangle at position (362, 159).
; PLAN: r0=362(x), r1=159(y), r2=93(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 159
LDI r2, 93
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
