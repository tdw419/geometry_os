; DESCRIPTION: Places a green 52x32 rectangle at position (365, 12).
; PLAN: r0=365(x), r1=12(y), r2=52(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 12
LDI r2, 52
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
