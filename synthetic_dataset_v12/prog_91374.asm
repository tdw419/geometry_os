; DESCRIPTION: Places a black 93x86 rectangle at position (225, 3).
; PLAN: r0=225(x), r1=3(y), r2=93(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 3
LDI r2, 93
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
