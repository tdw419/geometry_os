; DESCRIPTION: Places a cyan 58x40 rectangle at position (206, 32).
; PLAN: r0=206(x), r1=32(y), r2=58(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 32
LDI r2, 58
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
