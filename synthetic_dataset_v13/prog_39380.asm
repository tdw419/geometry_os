; DESCRIPTION: Places a cyan 68x32 rectangle at position (283, 134).
; PLAN: r0=283(x), r1=134(y), r2=68(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 134
LDI r2, 68
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
