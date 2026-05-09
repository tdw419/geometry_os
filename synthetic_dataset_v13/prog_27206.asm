; DESCRIPTION: Places a yellow 61x32 rectangle at position (342, 99).
; PLAN: r0=342(x), r1=99(y), r2=61(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 99
LDI r2, 61
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
