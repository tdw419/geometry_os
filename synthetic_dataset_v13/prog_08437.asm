; DESCRIPTION: Places a yellow 80x90 rectangle at position (57, 86).
; PLAN: r0=57(x), r1=86(y), r2=80(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 86
LDI r2, 80
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
