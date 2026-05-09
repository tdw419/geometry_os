; DESCRIPTION: Places a yellow 57x80 rectangle at position (157, 27).
; PLAN: r0=157(x), r1=27(y), r2=57(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 27
LDI r2, 57
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
