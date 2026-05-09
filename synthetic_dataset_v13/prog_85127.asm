; DESCRIPTION: Places a yellow 18x66 rectangle at position (42, 134).
; PLAN: r0=42(x), r1=134(y), r2=18(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 134
LDI r2, 18
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
