; DESCRIPTION: Places a cyan 109x60 rectangle at position (54, 163).
; PLAN: r0=54(x), r1=163(y), r2=109(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 163
LDI r2, 109
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
