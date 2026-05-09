; DESCRIPTION: Places a magenta 113x18 rectangle at position (273, 225).
; PLAN: r0=273(x), r1=225(y), r2=113(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 225
LDI r2, 113
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
