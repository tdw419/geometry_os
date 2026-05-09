; DESCRIPTION: Places a green 18x42 rectangle at position (36, 195).
; PLAN: r0=36(x), r1=195(y), r2=18(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 195
LDI r2, 18
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
