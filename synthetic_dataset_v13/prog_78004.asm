; DESCRIPTION: Places a green 55x64 rectangle at position (419, 46).
; PLAN: r0=419(x), r1=46(y), r2=55(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 46
LDI r2, 55
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
