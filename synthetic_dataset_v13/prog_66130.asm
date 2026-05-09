; DESCRIPTION: Places a yellow 74x27 rectangle at position (21, 45).
; PLAN: r0=21(x), r1=45(y), r2=74(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 45
LDI r2, 74
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
