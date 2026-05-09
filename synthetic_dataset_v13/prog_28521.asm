; DESCRIPTION: Places a green 24x16 rectangle at position (376, 71).
; PLAN: r0=376(x), r1=71(y), r2=24(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 71
LDI r2, 24
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
