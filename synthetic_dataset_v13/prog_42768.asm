; DESCRIPTION: Places a magenta 89x86 rectangle at position (186, 18).
; PLAN: r0=186(x), r1=18(y), r2=89(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 18
LDI r2, 89
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
