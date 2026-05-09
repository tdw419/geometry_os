; DESCRIPTION: Places a cyan 63x59 rectangle at position (207, 192).
; PLAN: r0=207(x), r1=192(y), r2=63(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 192
LDI r2, 63
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
