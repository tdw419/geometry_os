; DESCRIPTION: Places a magenta 84x64 rectangle at position (352, 22).
; PLAN: r0=352(x), r1=22(y), r2=84(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 22
LDI r2, 84
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
