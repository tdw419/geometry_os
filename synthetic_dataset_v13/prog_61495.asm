; DESCRIPTION: Places a cyan 86x86 rectangle at position (51, 32).
; PLAN: r0=51(x), r1=32(y), r2=86(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 32
LDI r2, 86
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
