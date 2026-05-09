; DESCRIPTION: Places a green 92x10 rectangle at position (345, 86).
; PLAN: r0=345(x), r1=86(y), r2=92(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 86
LDI r2, 92
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
