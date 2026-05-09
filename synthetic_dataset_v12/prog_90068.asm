; DESCRIPTION: Places a yellow 103x58 rectangle at position (319, 134).
; PLAN: r0=319(x), r1=134(y), r2=103(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 134
LDI r2, 103
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
