; DESCRIPTION: Places a yellow 59x86 rectangle at position (328, 64).
; PLAN: r0=328(x), r1=64(y), r2=59(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 64
LDI r2, 59
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
