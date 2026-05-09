; DESCRIPTION: Places a yellow 32x79 rectangle at position (73, 117).
; PLAN: r0=73(x), r1=117(y), r2=32(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 117
LDI r2, 32
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
