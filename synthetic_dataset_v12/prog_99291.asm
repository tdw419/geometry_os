; DESCRIPTION: Places a yellow 42x48 rectangle at position (73, 80).
; PLAN: r0=73(x), r1=80(y), r2=42(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 80
LDI r2, 42
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
