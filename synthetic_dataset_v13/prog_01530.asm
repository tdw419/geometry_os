; DESCRIPTION: Places a cyan 63x71 rectangle at position (225, 28).
; PLAN: r0=225(x), r1=28(y), r2=63(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 28
LDI r2, 63
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
