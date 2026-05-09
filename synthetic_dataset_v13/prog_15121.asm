; DESCRIPTION: Places a green 101x79 rectangle at position (215, 163).
; PLAN: r0=215(x), r1=163(y), r2=101(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 163
LDI r2, 101
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
