; DESCRIPTION: Places a black 115x16 rectangle at position (259, 213).
; PLAN: r0=259(x), r1=213(y), r2=115(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 213
LDI r2, 115
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
