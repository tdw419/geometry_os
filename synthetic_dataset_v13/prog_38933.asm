; DESCRIPTION: Places a yellow 57x31 rectangle at position (27, 164).
; PLAN: r0=27(x), r1=164(y), r2=57(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 164
LDI r2, 57
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
