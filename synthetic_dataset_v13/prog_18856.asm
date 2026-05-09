; DESCRIPTION: Places a black 20x21 rectangle at position (168, 167).
; PLAN: r0=168(x), r1=167(y), r2=20(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 167
LDI r2, 20
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
