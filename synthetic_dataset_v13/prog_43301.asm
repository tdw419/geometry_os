; DESCRIPTION: Places a green 83x40 rectangle at position (221, 27).
; PLAN: r0=221(x), r1=27(y), r2=83(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 27
LDI r2, 83
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
