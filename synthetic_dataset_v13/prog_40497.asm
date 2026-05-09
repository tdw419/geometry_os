; DESCRIPTION: Places a yellow 39x93 rectangle at position (27, 86).
; PLAN: r0=27(x), r1=86(y), r2=39(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 86
LDI r2, 39
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
