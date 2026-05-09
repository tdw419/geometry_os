; DESCRIPTION: Places a cyan 48x21 rectangle at position (184, 219).
; PLAN: r0=184(x), r1=219(y), r2=48(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 219
LDI r2, 48
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
