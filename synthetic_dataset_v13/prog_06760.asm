; DESCRIPTION: Places a green 32x59 rectangle at position (225, 182).
; PLAN: r0=225(x), r1=182(y), r2=32(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 182
LDI r2, 32
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
