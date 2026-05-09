; DESCRIPTION: Places a magenta 47x86 rectangle at position (199, 1).
; PLAN: r0=199(x), r1=1(y), r2=47(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 1
LDI r2, 47
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
