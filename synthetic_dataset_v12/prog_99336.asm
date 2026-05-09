; DESCRIPTION: Places a green 27x35 rectangle at position (274, 0).
; PLAN: r0=274(x), r1=0(y), r2=27(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 0
LDI r2, 27
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
