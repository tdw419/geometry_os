; DESCRIPTION: Places a black 48x64 rectangle at position (54, 0).
; PLAN: r0=54(x), r1=0(y), r2=48(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 0
LDI r2, 48
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
