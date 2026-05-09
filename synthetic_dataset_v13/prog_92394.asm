; DESCRIPTION: Places a white 81x86 rectangle at position (247, 80).
; PLAN: r0=247(x), r1=80(y), r2=81(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 80
LDI r2, 81
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
