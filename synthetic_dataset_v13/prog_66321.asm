; DESCRIPTION: Places a green 109x71 rectangle at position (304, 60).
; PLAN: r0=304(x), r1=60(y), r2=109(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 60
LDI r2, 109
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
