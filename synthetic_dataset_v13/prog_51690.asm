; DESCRIPTION: Places a cyan 112x86 rectangle at position (36, 69).
; PLAN: r0=36(x), r1=69(y), r2=112(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 69
LDI r2, 112
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
