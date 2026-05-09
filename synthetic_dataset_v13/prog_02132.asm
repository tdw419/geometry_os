; DESCRIPTION: Places a cyan 25x86 rectangle at position (189, 101).
; PLAN: r0=189(x), r1=101(y), r2=25(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 101
LDI r2, 25
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
