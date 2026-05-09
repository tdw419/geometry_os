; DESCRIPTION: Places a cyan 30x30 rectangle at position (196, 223).
; PLAN: r0=196(x), r1=223(y), r2=30(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 223
LDI r2, 30
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
