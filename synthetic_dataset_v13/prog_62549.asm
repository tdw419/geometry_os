; DESCRIPTION: Places a green 24x24 rectangle at position (237, 218).
; PLAN: r0=237(x), r1=218(y), r2=24(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 218
LDI r2, 24
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
