; DESCRIPTION: Places a green 36x120 rectangle at position (304, 20).
; PLAN: r0=304(x), r1=20(y), r2=36(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 20
LDI r2, 36
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
