; DESCRIPTION: Places a green 36x86 rectangle at position (24, 150).
; PLAN: r0=24(x), r1=150(y), r2=36(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 150
LDI r2, 36
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
