; DESCRIPTION: Places a green 113x45 rectangle at position (272, 101).
; PLAN: r0=272(x), r1=101(y), r2=113(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 101
LDI r2, 113
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
