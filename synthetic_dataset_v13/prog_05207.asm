; DESCRIPTION: Places a cyan 58x63 rectangle at position (197, 25).
; PLAN: r0=197(x), r1=25(y), r2=58(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 25
LDI r2, 58
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
